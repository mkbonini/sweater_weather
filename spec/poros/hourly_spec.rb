RSpec.describe Hourly do
  it "exists and has attributes" do
    data =
    {
      "dt": 1664222400,
      "temp": 79.75,
      "feels_like": 79.75,
      "pressure": 1020,
      "humidity": 24,
      "dew_point": 39.81,
      "uvi": 5.95,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 5.17,
      "wind_deg": 59,
      "wind_gust": 4.74,
      "weather": [
          {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
          }
      ],
      "pop": 0
  }
    hourly_weather = Hourly.new(data)

    expect(hourly_weather).to be_a(Hourly)
    expect(hourly_weather.time).to be_a(Time) 
    expect(hourly_weather.temperature).to be_a(Float)
    expect(hourly_weather.conditions).to be_a(String)
    expect(hourly_weather.icon).to be_a(String)
  end
end

