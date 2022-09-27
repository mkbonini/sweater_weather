require 'rails_helper'

RSpec.describe LocationService do
  it "makes an api call and returns a latitude and longitude" do
    response = LocationService.get_location('denver,co')

    expect(response).to be_a(Hash)
    expect(response[:lat]).to be_a(Float)
    expect(response[:lon]).to be_a(Float)
  end
end