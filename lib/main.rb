require 'sinatra'
require 'faraday'
require 'json'

class Main < Sinatra::Base
  get '/' do
    "Welcome"
  end

  get '/recommend-hikes' do
    location = params[:location]
    estimated_mile_pace = params[:estimated_mile_pace]
    
  end



end
