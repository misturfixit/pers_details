require "sinatra"
enable :sessions
get '/' do 
	msg = params[:msg] || ""
	erb :login, locals: {msg: msg}
end	

def login(username, password)
	if username == "Joe" && password == "Pwd"
		redirect '/name'	
	else
		redirect '/?msg=INCORRECT USERNAME/PASSWORD..
		...3 TRYS REMAIN UNTIL SELF-DESTRUCT'
	end	
end


post '/username' do
	username = params[:username]
	password = params[:password]
	login(username, password) 
end

get '/name' do
 	frstn = params[:title]
	erb :moniker, locals: {frstn: frstn}
end
post '/name' do
	#session[:age] = 38
 	frstn = params[:title]
 	redirect '/surname?frstn=' + frstn
end
get '/surname' do
	frstn = params[:frstn]	
	erb :sur, locals: {frstn: frstn}
end
post '/surname' do
	s_name = params[:s_name]
	frstn = params[:frstn]
	redirect '/furry?s_name=' + s_name + "&frstn=" + frstn 
end	
get '/furry' do
	frstn = params[:frstn]
	s_name = params[:s_name]
	erb :visage, locals: {frstn: frstn, s_name: s_name} 
end
post '/furry' do
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	redirect '/balls?fur=' + fur + "&s_name=" + s_name + "&frstn=" + frstn
end
get '/balls' do
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	erb :vis, locals: {frstn: frstn, s_name: s_name, fur: fur} 
end
post '/balls' do
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	redirect '/age?orbs=' + orbs + "&fur=" + fur + "&s_name=" + s_name + "&frstn=" + frstn 
end
get '/age' do 
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	erb :years, locals: {frstn: frstn, s_name: s_name, fur: fur, orbs: orbs} 
end



