class WeatherFacade
  def self.full_weather(location)
    lat_lon = LocationService.get_location(location)

    weather = WeatherService.get_weather(lat_lon[:lat], lat_lon[:lon])
    current = Current.new(weather[:current])
    daily_weather = []
    hourly_weather = []

    weather[:daily].first(5).each do |day|
      daily_weather << Daily.new(day)
    end

    weather[:hourly].first(8).each do |hr|
      hourly_weather << Hourly.new(hr)
    end

    Weather.new( [current, daily_weather, hourly_weather] )

    # Forecast.new(weather)
  end
end