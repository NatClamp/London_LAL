require 'sinatra'

# function to create api request URL
def endpointBuilder(location, keywords)
  return "http://api.eventful.com/rest/events/search?app_key=" + ENV['APP_KEY'] + "&location=" + location + ",UK&keywords=" + keywords
end


# Home route - uses index.erb view
get('/') do
  erb :index
end

# Results route
post('/events') do
  puts params[:location]
  puts params[:keyword]
  puts endpointBuilder(params[:location], params[:keyword])
  erb :results
end

# Email signup route
post('/signup') do
  puts params[:name]
  puts params[:email]
  erb :thankyou
end
