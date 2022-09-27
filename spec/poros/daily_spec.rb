RSpec.describe Daily do
  it "exists and has attributes" do
    data =
    {
      "dt": 1664215200,
      "sunrise": 1664196679,
      "sunset": 1664239866,
      "moonrise": 1664199120,
      "moonset": 1664242140,
      "moon_phase": 0.03,
      "temp": {
          "day": 78.6,
          "min": 59.52,
          "max": 80.64,
          "night": 69.17,
          "eve": 79.81,
          "morn": 60.03
      },
      "feels_like": {
          "day": 77.14,
          "night": 66.92,
          "eve": 79.81,
          "morn": 57.42
      },
      "pressure": 1019,
      "humidity": 21,
      "dew_point": 35.46,
      "wind_speed": 6.69,
      "wind_deg": 75,
      "wind_gust": 11.52,
      "weather": [
          {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
          }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 6.52
  }
    daily_weather = Daily.new(data)

    expect(daily_weather).to be_a(Daily)
    expect(daily_weather.datetime).to be_a(Time) 
    expect(daily_weather.sunrise).to be_a(Time)
    expect(daily_weather.sunset).to be_a(Time)
    expect(daily_weather.max_temp).to be_a(Float)
    expect(daily_weather.min_temp).to be_a(Float)
    expect(daily_weather.conditions).to be_a(String)
    expect(daily_weather.icon).to be_a(String)
  end
end

