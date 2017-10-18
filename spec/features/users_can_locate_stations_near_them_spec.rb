require 'rails_helper'

describe "user can search for stations near them" do
  it "will return information about stations that provide electric and propane" do

    visit "/"
    fill_in 'search', with: "80203"
    click_on "Locate"

    expect(current_path).to eq("/search?zip_code=80203")
    expect(Station.count).to eq(10)
    expect(page).to have_content(station_1.name)
    expect(page).to have_content(station_1.address)
    expect(page).to have_content(station_1.fuel_types)
    expect(page).to have_content(station_1.distance)
    expect(page).to have_content(station_1.access_time)
  end
end
