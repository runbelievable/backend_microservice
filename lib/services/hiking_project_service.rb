require 'sinatra'
require 'faraday'
require 'dotenv/load'

class HikingProjectService
  def initialize(latlon)
    @lat= latlon[:lat]
    @lon= latlon[:lng]
  end


  def get_hike_routes
   hike_route_recs = connection.get("/data/get-trails?lat=#{@lat}&lon=#{@lon}&maxDistance=10&key=#{ENV['apiKey']}")
   response = JSON.parse(hike_route_recs.body, symbolize_names: true)
   response[:trails].shuffle.pop.to_json
  end

  private
    def connection
      Faraday.new(url: 'https://www.hikingproject.com')
    end
end
