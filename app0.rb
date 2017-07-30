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
post '/age' do
	yrs = params[:yrs]
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	redirect '/food&?yrs=' + yrs  + "&orbs=" + orbs + "&fur=" + fur + "&s_name=" + s_name + "&frstn=" + frstn 
end

get '/food&' do
	yrs = params[:yrs]
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	erb :fare, locals: {frstn: frstn, s_name: s_name, fur: fur, orbs: orbs, yrs: yrs} 
end

post '/food&' do
	grub = params[:grub]
	libs = params[:libs]  
	yrs = params[:yrs]
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	redirect '/numbers?grub=' + grub + "&libs=" + libs + "&yrs=" + yrs  + "&orbs=" + orbs + "&fur=" + fur + "&s_name=" + s_name + "&frstn=" + frstn 
end


get '/numbers' do 
	grub = params[:grub]
	libs = params[:libs] 
	yrs = params[:yrs]
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	erb :numb, locals: {frstn: frstn, s_name: s_name, fur: fur, orbs: orbs, yrs: yrs, grub: grub, libs: libs} 
end


post '/numbers' do
	 n1 = params[:n1]
	 n2 = params[:n2]
	 n3 = params[:n3]
# def consilidation
# 	nums = [:n1, :n2, :n3]
#    nums = params[:nums]
# end

	#nums = params[:nums]
	grub = params[:grub]
	libs = params[:libs] 
   yrs = params[:yrs]
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
 	redirect '/res?n1=' + n1 + "&n2=" n2 + "&n3=" + n3 + "&grub=" + grub + "&libs=" + libs + "&yrs=" + yrs + "&orbs=" + orbs + "&fur=" + fur + "&s_name=" + s_name + "&frstn=" + frstn 
end

get '/res' do
	#nums = params[:nums]
	n1 = params[:n1]
   n2 = params[:n2]
	n3 = params[:n3]
	grub = params[:grub]
	libs = params[:libs] 
   yrs = params[:yrs]
	orbs = params[:orbs]
	fur = params[:fur]
 	frstn = params[:frstn]
 	s_name = params[:s_name]
	erb :results, locals: {frstn: frstn, s_name: s_name, fur: fur, orbs: orbs, yrs: yrs, grub: grub, libs: libs, n1: n1, n2: n2, n3: n3} 
end 	



#n1= n1 + "&n2=" + n2 + "&n3=" + n3 +
