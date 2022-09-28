require 'rails_helper'

RSpec.describe "roadtrip Request" do 
  it 'returns weather forecast about a location' do
    headers = {"CONTENT_TYPE" => "application/json"}
    user_params = {
      "email": "test@test.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
    roadtrip_params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": User.last.api_key
    }
    post "/api/v1/road_trip", headers: headers, params: JSON.generate(road_trip: roadtrip_params)

    expect(response).to be_successful
    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:id]).to eq(nil)
    expect(result[:type]).to eq("roadtrip")

    expect(result[:attributes]).to have_key(:start_city)
    expect(result[:attributes]).to have_key(:end_city)
    expect(result[:attributes]).to have_key(:travel_time)
    expect(result[:attributes]).to have_key(:weather_at_eta)
    expect(result[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(result[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(result[:attributes][:weather_at_eta]).to have_key(:conditions)
  end
end