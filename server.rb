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

  # The below line generates a ruby hash we can pass into the view
  result = parser.parse(api_response)
  @result = result["search"]["events"]["event"]

  # The below line generates some JSON from that hash for dev/logging purposes only (since ruby treats JSON like a string)
  # @all_data = JSON.pretty_generate(result)

  erb :results
end


# Email signup route
post('/signup') do
  puts params[:name]
  puts params[:email]
  erb :thankyou
end
