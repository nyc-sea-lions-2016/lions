# Event Delegation
# Partials
# bind and scope
# Data Ids

#1. Make a page that a user can type a message, and see all current messages.
#2. Allow user to enter a new message
#3. AJAX Post that message
#4. Create a short poll to show all messages to the user.

get '/messages' do
  @messages = Message.all
  @msg_count = @messages.length
  erb :'message'
end

get '/messages/update' do
  new_messages = Message.where("id > ?", params[:message_id])
  new_messages.to_json
end

get '/messages/new' do 
  if request.xhr?
    erb :_new_message, layout: false
  end
end

post '/messages' do 
  message = Message.new(message: params[:message])
  if message.save
    {message_count: Message.count }.to_json
  end
end