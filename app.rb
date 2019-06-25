#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def get_db
		db = SQLite3::Databbase.new 'barbershop.db'
		db.results_as_hash = true
		return db
	end

configure do
	@db = SQLite3::Databbase.new 'barbershop.db'
	db.execute 'CREATE TABLE IF NOT EXISTS "users" 
	(
	"id" INTEGER PRIMARY KEY AUTOINCREMENT, 
	"username" TEXT, 
	"phone" TEXT,
	"datestamp" TEXT
	"barber" TEXT
	"color" TEXT);'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do

	@error = 'something wrong!'
	erb :about
	end
	get '/visit' do
		erb :visit
	end
	post '/visit' do

		@username = params[:username]
		@phone = params[:phone]
		@datetime = params[:datetime]
		@barber = params[:barber]
		@color = params[:color]

hh = {

		:username => 'Enter name'
		:phone => 'Enter phone'
		:datetime => 'Enter date and time'

}
		
			@error hh.select {|key,_ params[key] == }.values.join(",")

		if @error != ''
					 erb visit
		end
db = get_db
			db.execute 'insert into Users (
			username, 
			phone, 
			datestamp, 
			barber, 
			color
			)	
			values (?,?,?,?,?)', [@username, @phone, @datetime, @barber, @color]
		
	
		erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

	end
	get '/showusers' do 
		erb "Hello world"
	end
	