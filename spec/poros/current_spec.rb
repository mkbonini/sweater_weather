RSpec.describe Current do
  it "exists and has attributes" do
    data =
     {
      "dt": 1664222564,
      "sunrise": 1664196679,
      "sunset": 1664239866,
      "temp": 79.75,
      "feels_like": 79.75,
      "pressure": 1020,
      "humidity": 24,
      "dew_point": 39.81,
      "uvi": 5.95,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 5.01,
      "wind_deg": 44,
      "wind_gust": 11.99,
      "weather": [
          {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
          }
      ]
  }
    current_weather = Current.new(data)

    expect(current_weather).to be_a(Current)
    expect(current_weather.datetime).to be_a(Time) 
    expect(current_weather.sunrise).to be_a(Time)
    expect(current_weather.sunset).to be_a(Time)
    expect(current_weather.temperature).to be_a(Float)
    expect(current_weather.feels_like).to be_a(Float)
    expect(current_weather.humidity).to be_a(Numeric)
    expect(current_weather.uvi).to be_a(Numeric)
    expect(current_weather.visibility).to be_a(Numeric)
    expect(current_weather.conditions).to be_a(String)
    expect(current_weather.icon).to be_a(String)
  end
end

