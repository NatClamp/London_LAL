require 'sinatra'

get('/') do
  erb :index
end

get('/:name') do
  @name = params[:name].capitalize

  erb :index
end

post('/signup') do
  puts params[:name]
  puts params[:email]

  "All OK"
end
