get '/login' do
  erb :'/sessions/new'
end

post '/login' do
  sea_lion = SeaLion.find_by(name: params[:sea_lion][:name])
  if sea_lion && sea_lion.authenticate(params[:sea_lion][:password])
    session[:sea_lion_id] = sea_lion.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
