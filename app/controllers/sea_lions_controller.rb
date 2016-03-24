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
  @skills = Skill.all
  erb :'/sea_lions/new'
end

# Sea Lions create action
post '/sea_lions' do
  skills_records = params[:skills].map { |skill_id| Skill.find(skill_id) }
  sea_lion = SeaLion.create(params[:sea_lion].merge(skills: skills_records))
  redirect "/sea_lions/#{sea_lion.id}"
end

# Sea Lions show action
get '/sea_lions/:id' do
  @sea_lion = SeaLion.find(params[:id])
  erb :'/sea_lions/show'
end

# Sea Lions edit action
get '/sea_lions/:id/edit' do
  @sea_lion = SeaLion.find(params[:id])
  erb :'/sea_lions/edit'
end

# Sea Lions update action
put '/sea_lions/:id' do
  sea_lion = SeaLion.find(params[:id])
  sea_lion.update(params[:sea_lion])
  redirect "/sea_lions/#{sea_lion.id}"
end

# Sea Lions destroy action
delete '/sea_lions/:id' do
  sea_lion = SeaLion.find(params[:id])
  sea_lion.destroy
  redirect '/sea_lions'
end
