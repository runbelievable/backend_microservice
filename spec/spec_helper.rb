require 'rack/test'
require 'rspec'

# VCR.configure do |config|
#   config.ignore_localhost = true
#   config.cassette_library_dir = 'spec/cassettes'
#   config.hook_into :webmock
#   config.default_cassette_options = { record: :new_episodes, erb: true }
#   config.configure_rspec_metadata!
# end

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../lib/main.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
