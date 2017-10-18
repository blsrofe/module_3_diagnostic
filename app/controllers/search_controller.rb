class SearchController < ApplicationController
  def index
    response = Faraday.get 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json' do |req|
      req.params['fuel_type'] = 'LPG,ELEC'
      req.params['location'] = params[:q]
      req.params['limit'] = '10'
      req.params['api_key'] = ENV['API_KEY']
      req.params['format'] = 'JSON'
      req.params['radius'] = '6.0'
    end
    raw_info = JSON.parse(response.body)
    @stations = StationService.new(raw_info).sort_by_distance
  end
end
