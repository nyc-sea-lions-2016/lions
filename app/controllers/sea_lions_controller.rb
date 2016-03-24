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
  @sea_lion = SeaLion.new
  @skills = Skill.all
  erb :'/sea_lions/new'
end

# Sea Lions create action
post '/sea_lions' do
  params[:skills] ||= []
  skills_records = params[:skills].map { |skill_id| Skill.find(skill_id) }
  @sea_lion = SeaLion.new(params[:sea_lion].merge(skills: skills_records))
  if @sea_lion.save
    redirect "/sea_lions/#{sea_lion.id}"
  else
    @errors = @sea_lion.errors.full_messages
    @skills = Skill.all
    erb :'/sea_lions/new'
  end
end

# Sea Lions show action
get '/sea_lions/:id' do
  @sea_lion = SeaLion.find(params[:id])
  halt(401, erb(:unauthorized)) unless current_user == @sea_lion
  erb :'/sea_lions/show'
end

# Sea Lions edit action
get '/sea_lions/:id/edit' do
  @sea_lion = SeaLion.find(params[:id])
  halt(401, erb(:unauthorized)) unless current_user == @sea_lion
  erb :'/sea_lions/edit'
end

# Sea Lions update action
put '/sea_lions/:id' do
  @sea_lion = SeaLion.find(params[:id])
  halt(401, erb(:unauthorized)) unless current_user == @sea_lion
  @sea_lion.assign_attributes(params[:sea_lion])
  if @sea_lion.save
    redirect "/sea_lions/#{@sea_lion.id}"
  else
    @errors = @sea_lion.errors.full_messages
    erb :'/sea_lions/edit'
  end
end

# Sea Lions destroy action
delete '/sea_lions/:id' do
  sea_lion = SeaLion.find(params[:id])
  halt(401, erb(:unauthorized)) unless current_user == @sea_lion
  sea_lion.destroy
  redirect '/sea_lions'
end
