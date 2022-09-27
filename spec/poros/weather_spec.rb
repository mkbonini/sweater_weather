RSpec.describe Weather do
  it "exists and has attributes" do
    current_data = 
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
    daily_data = 
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
    hourly_data =
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
    weather = Weather.new( [Current.new(current_data), Daily.new(daily_data), Hourly.new(hourly_data)] )

    expect(weather).to be_a(Weather)
    expect(weather.id).to eq(nil) 
    expect(weather.current_weather).to be_a(Current)
    expect(weather.daily_weather).to be_a(Daily)
    expect(weather.hourly_weather).to be_a(Hourly)
  end
end