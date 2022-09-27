require 'rails_helper'

RSpec.describe "forecast Request" do 
  it 'returns weather forecast about a location' do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:id]).to eq(nil)
    expect(result[:type]).to eq("forecast")

    expect(result[:attributes]).to have_key(:current_weather)
    expect(result[:attributes]).to have_key(:daily_weather)
    expect(result[:attributes]).to have_key(:hourly_weather)
    expect(result[:attributes][:current_weather]).to be_a(Hash)
    expect(result[:attributes][:daily_weather]).to be_a(Array)
    expect(result[:attributes][:hourly_weather]).to be_a(Array)
    expect(result[:attributes][:daily_weather].count).to eq(5)
    expect(result[:attributes][:hourly_weather].count).to eq(8)
  end
end