require "sinatra"
enable :sessions
	get '/' do 
	erb :names
end

post '/name' do
	session[:age] = "30sumfin"
 	f_name = params[:uzr_name]
	redirect '/lastname?first_name=' + f_name  
end

get '/lastname' do 
	first_name = params[:first_name]	
	erb :lasname, locals: {first_n: first_name}
end

post '/l_name' do
	lastname = params[:l_name]
	f_name = params[:f_name]
	redirect '/numbrs?l_name=' + lastname + "&f_name=" + f_name 
end	

get '/numbrs' do
	f_name = params[:f_name]
	l_name = params[:l_name]
	erb :numbrs, locals: {first: f_name, last: l_name}	
end

post '/numbers' do
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]
	first = params['f_name']
	last = params['l_name']
	#{}"#{num1}#{num2}#{num3}  ,,,  #{first}, #{last}, #{session[:age]}"
 	redirect '/results?l_name=' + last + "&f_name=" + first + "&num1=" + num1 + "&num2=" + num2 + "&num3=" + num3
end

get '/results' do
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]
	first = params['f_name']
	last = params['l_name']
	erb :results, locals: {first: first, last: last, num1: num1, num2: num2, num3: num3, age: session[:age]}

#erb :numbers
end