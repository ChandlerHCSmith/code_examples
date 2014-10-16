get '/' do
  @grandma = params[:grandma]
  erb :index
end

post '/grandma' do
  if params[:user_input] == params[:user_input].upcase
    @grandma = "You don't need to shout.  Grandma's not deaf yet...."
  elsif params[:user_input] == params[:user_input].capitalize
    @grandma = "You are such a sweet boy."
  else
  	@grandma = "Speak up, kiddo!"
  end

  redirect "/?grandma=#{@grandma}"
end