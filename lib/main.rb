require 'sinatra'
require 'faraday'
require 'json'
require_relative './services/hiking_project_service'
require_relative './services/geocode_service'

class Main < Sinatra::Base
  get '/' do
    "Welcome"
  end

  get '/recommend-hikes' do
    location = params[:location]
    geo_service = GeoCodeService.new
    latlon = geo_service.location_info(location)[:geometry][:location]
    service = HikingProjectService.new(latlon)
    service.get_hike_routes
  end

end
