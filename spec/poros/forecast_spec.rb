RSpec.describe Forecast do
  it "exists and has attributes" do
    weather = WeatherService.get_weather(39.738453, -104.984853)
    forecast = Forecast.new(weather[:current])

    expect(forecast).to be_a Forecast
    expect(forecast.summary).to be_a String
    expect(forecast.temperature).to be_a String
  end
end