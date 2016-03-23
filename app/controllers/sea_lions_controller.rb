# a redirect from the home page to the Sea Lions index action
get '/' do
  redirect '/sea_lions'
end

# Sea Lions index action
get '/sea_lions' do
  @sea_lions = SeaLion.all
  erb :'/sea_lions/index'
end

# Sea Lions new action
get '/sea_lions/new' do
  erb :'/sea_lions/new'
end

# Sea Lions create action
post '/sea_lions' do
  sea_lion = SeaLion.create(params)
  redirect "/sea_lions/#{sea_lion.id}"
end

# Sea Lions show action
get '/sea_lions/:id' do
  @sea_lion = SeaLion.find(params[:id])
  erb :'/sea_lions/show'
end
