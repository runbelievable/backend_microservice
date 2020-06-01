require 'spec_helper'

RSpec.describe 'Spoonacular API Service', type: :request do
  def app
    Main
  end

  it 'should be able to go to the home page' do
    get '/'

    expect(last_response).to be_successful
  end

  it 'retrieves hiking recommendations' do
    get '/recommend-hikes', {location: "Denver, CO" }
    expect(last_response).to be_successful
  end

end
