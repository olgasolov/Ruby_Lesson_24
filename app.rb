#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = "something wrong!"
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

	# хеш
	hh= { :username => 'Введите имя', 
	      :phone => 'Введите телефон', 
	      :datetime => 'Введите дату и время' }

	# для каждой пары ключ-значение

	hh.each do |key, value|
		# если параметр пуст
		if params[key] == ''
			# переменной error присвоить value из хеша
			# (а value из хеша hh - это сообщение об ошибке)
			# т.е. переменной error присвоить сообщение об ошибке
			@error = hh[key]

			# вернуть представление :visit
			return erb :visit
		end
	end
	
	erb "ОК, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"
end