class WeatherService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      # faraday.params['appid'] = ENV['weather_api_key']
    end
  end

  def self.get_weather(lat, lon)
    response = conn.get("/data/2.5/onecall") do |f|
      f.params['appid'] = ENV['weather_api_key']
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.destination_weather(lat, lon)
    response = conn.get("/data/2.5/onecall") do |f|
      f.params['appid'] = ENV['weather_api_key']
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['exclude'] = 'minutely,alerts,current'
      f.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end