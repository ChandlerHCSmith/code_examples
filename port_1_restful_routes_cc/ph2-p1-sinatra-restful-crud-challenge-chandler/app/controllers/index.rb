# NOTES: ---- ROUTES -------


# Read all Notes
get '/' do 	
	@notes = Note.all
	erb :index
end
# Store User data in database
get '/notes/new' do
  	p "params: #{params}"
	erb :note
end

post '/notes' do 
	p params
	Note.create({title: params[:title], content: params[:content]})			
	redirect '/'
end
# Read one Note
get '/notes/:id' do 		
	@note = Note.find params[:id]
	erb :note
end
# Update a specific Note
put '/notes/:id' do
  note = Note.find(params[:id])
  note.title = params[:title]
  note.content = params[:content]
  note.save
  redirect '/'
end
# Delete a specific Note
delete '/notes/:id' do
  Note.find(params[:id]).destroy
  redirect '/'
end
