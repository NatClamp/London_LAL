require 'sinatra'

get('/') do
  erb :index
end

post('/events') do
  puts params[:location]
  puts params[:keyword]
end

post('/signup') do
  puts params[:name]
  puts params[:email]

  "All OK"
end
