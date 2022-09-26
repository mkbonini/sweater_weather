class ForecastSerializer
  include JSONAPI::Serializer
  
  attributes :current_weather, :daily_weather, :hourly_weather
  set_id nil
  set_type :forecast
end