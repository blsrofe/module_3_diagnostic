class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'http://sushi.com') do |faraday|
      faraday.adapter  Faraday.default_adapter 
    end
  end
end
