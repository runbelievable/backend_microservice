require 'sinatra'
require 'faraday'
require 'dotenv/load'

class GeoCodeService

  def location_info(location)
    get_json(location)
  end

  private
  def conn
      Faraday.new(url: 'https://maps.googleapis.com/maps/api')
  end


  def get_json(location)
    response = conn.get('geocode/json') do |req|
      req.params['address'] = location
      req.params['key'] = ENV['GoogleKey']
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first
  end
end 
