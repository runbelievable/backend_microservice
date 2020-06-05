require 'spec_helper'


RSpec.describe 'Hiking API Service' do

  def app
    HikingProjectService
  end

  it 'should be able to go to the home page' do
     service = GeoCodeService.new
     location_info = service.location_info("denver, co")[:geometry][:location]
     hike = app.new(location_info)
     resp = hike.get_hike_routes
     result = JSON.parse(resp, symboilze_names: true)
     expect(result["length"]).to be_a Float
  end
end
