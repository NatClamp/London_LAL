require 'sinatra'
require 'net/http'
require 'open-uri'
require 'nori'
require 'json'

# function to create api request URL
def endpointBuilder(location, keywords)
  return "http://api.eventful.com/rest/events/search?app_key=" + ENV['APP_KEY'] + "&location=" + location + ",UK&keywords=" + keywords
end

# Home route - uses index.erb view
get('/') do
  erb :index
end

# About Us route - uses about.erb view
get('/about') do
  erb :about
end

# Results route
post('/events') do
  uri = URI(endpointBuilder(params[:location], params[:keyword]))
  # puts uri
  api_response = Net::HTTP.get(uri)
  parser = Nori.new
  result = parser.parse(api_response)
  # puts result
  if result["search"]["total_items"].to_i > 0
    result = result["search"]["events"]["event"]
    @top_five = result.first(5)
    erb :results
  else
    erb :noresults
  end
end


# Email signup route
post('/signup') do
  puts params[:name]
  puts params[:email]
  erb :thankyou
end
