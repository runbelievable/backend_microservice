require 'spec_helper'

RSpec.describe 'GeoCodeService & Hiking Project API Service' do

  def app
    GeoCodeService
  end

  it 'should get lat and lng from location GeoCode API' do
    
    service = app.new
    location_info = service.location_info("denver, co")[:geometry][:location]
    expect(location_info[:lat]).to be_a Float
    expect(location_info[:lng]).to be_a Float
  end
  
  it 'Hiking service API' do
    service = app.new
    location_info = service.location_info("denver, co")[:geometry][:location]
     service = HikingProjectService.new(location_info)
    hike = service.get_hike_routes
    hike_parsed = JSON.parse(hike, symbolize_names: true)
    # require "pry"; binding.pry
     expect(hike_parsed[:high]).to be_a Integer
     expect(hike_parsed[:stars]).to be_a Float
     expect(hike_parsed[:name]).to be_a String
     expect(hike_parsed[:type]).to be_a String
     expect(hike_parsed[:summary]).to be_a String
     expect(hike_parsed[:difficulty]).to be_a String
  end
end
