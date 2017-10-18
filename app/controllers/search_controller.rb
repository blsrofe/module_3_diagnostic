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
    station_info = raw_info["fuel_stations"]
    station_info.each do |station|
      Station.create(name: station["station_name"], address: station["street_address"], fuel_types: station["fuel_type_code"],
                      access_times: station["access_days_time"])
    end
    @stations = Station.all
  end
end
