require "sinatra"

get '/' do 
erb :names
end

post '/name' do
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
#{}"#{f_name}, #{lastname}"
redirect '/numbrs?l_name=' + lastname + "&f_name=" + f_name 
end	

get '/numbrs' do
f_name = params[:f_name]
l_name = params[:l_name]
#{}"#{f_name} #{l_name}"
erb :numbrs, locals: {first: f_name, last: l_name}	
end

post '/numbers' do
num1 = params[:num1]
num2 = params[:num2]
num3 = params[:num3]
first = params['f_name']
last = params['l_name']
"#{num1} #{num2} #{num3}, #{first}, #{last}"
#erb :numbers
end