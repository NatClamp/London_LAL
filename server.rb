require 'sinatra'
require 'net/http'
require 'open-uri'
require 'nori'
require 'json'

# function to create api request URL
def endpointBuilder(location, keywords)
  return "http://api.eventful.com/rest/events/search?app_key=" + ENV['APP_KEY'] + "&location=" + location + ",UK&keywords=" + keywords
end

# function to return only the data we want from the api
# def usefulData()
#   if statement ... haven't written yet
#     if no results, do this thing
#   else
#     for loop ... haven't written yet
#     loop through each <event> and print out specific tags
# end


# Home route - uses index.erb view
get('/') do
  erb :index
end

# Results route
post('/events') do
  uri = URI(endpointBuilder(params[:location], params[:keyword]))
  api_response = Net::HTTP.get(uri)
  parser = Nori.new
  result = parser.parse(api_response)
  all_data = JSON.pretty_generate(result)
  puts all_data
  erb :results
end

# Email signup route
post('/signup') do
  puts params[:name]
  puts params[:email]
  erb :thankyou
end
