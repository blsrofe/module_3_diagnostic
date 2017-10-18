class SearchController < ApplicationController
  def index
    # conn = Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1/') do |faraday|
    #   faraday.adapter  Faraday.default_adapter
    # end
    # response = conn.get '/nearest.json', { fuel_type: 'LPG,ELEC', location: '80203',
    #                                       limit: '10', api_key: ENV['API_KEY'],
    #                                       format: 'JSON', radius: '6.0'
    #                                       }
    response = Faraday.get 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json' do |req|
      req.params['fuel_type'] = 'LPG,ELEC'
      req.params['location'] = '80203'
      req.params['limit'] = '10'
      req.params['api_key'] = ENV['API_KEY']
      req.params['format'] = 'JSON'
      req.params['radius'] = '6.0'
    end
                                        
  end
end
