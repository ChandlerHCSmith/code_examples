get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index2
end

post '/sessions/player1' do
  user = User.find_by(username: params[:username])

  if user == nil
    @errors = "Your user is invalid"
  else
    session[:user_id] = user.id
    puts "IT WORKED!!!!"

    puts session[:user_id]

    user = User.find_by(id: session[:user_id])
    puts user.name
  end

  redirect '/'
end


post '/sessions/player2' do
  user = User.find_by(username: params[:username])

  if user == nil
    @errors = "Your user is invalid"
  else
    session[:user2_id] = user.id
    puts "IT WORKED!!!!"

    puts session[:user2_id]

    user = User.find_by(id: session[:user2_id])
    puts user.name
  end

  redirect '/'
end


delete '/sessions/player1/:id' do
  # sign-out -- invoked
  session[:user_id] = nil
  redirect '/'
end

delete '/sessions/player2/:id' do
  # sign-out -- invoked
  session[:user2_id] = nil
  redirect '/'
end


get '/users/new' do
  erb :sign_up
end

post '/users' do
  User.create(name: params[:name], username: params[:username])
  redirect "/"
end

