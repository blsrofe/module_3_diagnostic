class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
    response = conn.get '/nearest.json', { fuel_type: 'LPG,ELEC', location: '80203',
                                          limit: '10', api_key: 'ENV['API_KEY']',
                                          format: 'JSON', radius: '6.0'
                                          }
                                          binding.pry
  end
end
