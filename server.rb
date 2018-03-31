require 'sinatra'

# Home route - uses index.erb view
get('/') do
  erb :index
end

# Results route
post('/events') do
  puts params[:location]
  puts params[:keyword]
  erb :results
end

# Email signup route
post('/signup') do
  puts params[:name]
  puts params[:email]
  erb :thankyou
end
