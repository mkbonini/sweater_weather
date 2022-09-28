class RoadtripFacade
  def self.get_roadtrip(roadtrip_params)
    # origin_lat_lon = LocationService.get_location(roadtrip_params[:origin])
    # destination_lat_lon = LocationService.get_location(roadtrip_params[:destination])
    trip_time = LocationService.get_route_time(roadtrip_params[:origin], roadtrip_params[:destination])
    # binding.pry
    if trip_time.is_a?(Numeric)
      final_time = Time.now + trip_time
      destination_lat_lon = LocationService.get_location(roadtrip_params[:destination])
      weather = WeatherService.destination_weather(destination_lat_lon[:lat],destination_lat_lon[:lon])
      Roadtrip.new(roadtrip_params[:origin], roadtrip_params[:destination], trip_time, weather)
    else
      Roadtrip.new(roadtrip_params[:origin], roadtrip_params[:destination], trip_time, {})
    end
    # Forecast.new(weather)
  end
end