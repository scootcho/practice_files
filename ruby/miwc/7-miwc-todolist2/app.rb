# require the file that sets everything up
require_relative 'boot'

get '/todos' do
  @todos = ToDo.order('completed ASC') 
  erb :index, layout: :bootstrap
end

get '/todos/new' do
  erb :new, layout: :bootstrap
end

post '/todos' do
  @post = ToDo.new(params[:todo])
  @post.save
  redirect '/todos'
end

post '/delete-todo' do
  the_todo = ToDo.where(id: params[:todo][:id]).first
  the_todo.completed = true
  the_todo.save
  redirect '/todos'
end