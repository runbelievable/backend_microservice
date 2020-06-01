require 'sinatra'
require 'faraday'
require 'dotenv/load'

class HikingProjectService
  def initialize(latlon)
    @lat= latlon[:lat]
    @lon= latlon[:lng]
  end


  def get_hike_routes
    hike_route_recs = connection.get("/data/get-trails?lat=#{@lat}&lon=#{@lon}&maxDistance=10&key=#{ENV['apiKey']}") #do |faraday|
    #   faraday.params['lat'] = @lat
    #   faraday.params['lon'] = @lon
    #   faraday.params['maxDistance'] = dist #distance from lat/lon
    #   faraday.params['key'] = ENV['apiKey'] #add api key
    # end
   response = JSON.parse(hike_route_recs.body, symbolize_names: true)
   response[:trails].shuffle.pop.to_json
  end

  private
    def connection
      Faraday.new(url: 'https://www.hikingproject.com')
    end
end
