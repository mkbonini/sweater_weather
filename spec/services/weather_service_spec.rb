require 'rails_helper'

RSpec.describe WeatherService do
  it "makes an api call and returns a weather forecast" do
    response = WeatherService.get_weather(39.738453, -104.984853)

    expect(response).to be_a(Hash)
    expect(response[:current]).to be_a(Hash)
    expect(response[:hourly]).to be_a(Array)
    expect(response[:hourly].first[:weather].first[:description]).to be_a(String)
    expect(response[:daily]).to be_a(Array)
  end
end