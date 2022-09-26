class WeatherFacade
  def self.full_weather(location)
    reply = LocationService.get_location(location)
    lat_lon = JSON.parse(reply.body, symbolize_names: true)
    lat = lat_lon[:results][0][:locations][0][:latLng][:lat]
    lon = lat_lon[:results][0][:locations][0][:latLng][:lng]
    weather = WeatherService.get_weather(lat, lon)

    current = Current.new(weather[:current])
    daily_weather = []
    hourly_weather = []

    weather[:daily].first(5).each do |day|
      daily_weather << Daily.new(day)
    end

    weather[:hourly].first(8).each do |hr|
      hourly_weather << Hourly.new(hr)
    end

    Weather.new([current, daily_weather, hourly_weather] )

    # Forecast.new(weather)
  end
end