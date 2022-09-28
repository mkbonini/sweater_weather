class Roadtrip 
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(origin, destination, duration, weather)
    @id = nil 
    @start_city = origin
    @end_city = destination 
    @travel_time = trip_duration(duration)
    @weather_at_eta = destination_weather(duration, weather)
  end

  def trip_duration(duration)
    return duration if duration == 'impossible route'

    hours = duration / 3600
    minutes = duration % 3600 / 60

    "#{hours} hours, #{minutes} minutes."
  end

  def destination_weather(duration, weather)
    return weather if weather == {}

    offset_hours = (duration/3600.0).round
    offset_hours = 1 if offset_hours < 1

    if offset_hours <= 48 
      offset_weather = weather[:hourly][offset_hours - 1]
      {
        temperature: offset_weather[:temp],
        conditions: offset_weather[:weather].first[:description]
      }
    elsif (offset_hours / 24).round <= 8
      offset_days = (offset_hours / 24.0).round
      offset_weather = weather[:daily][offset_days - 1]
      {
        temperature: offset_weather[:temp][:max],
        conditions: offset_weather[:weather].first[:description]
      }
    else
      {
        temperature: 'Unknown',
        conditions: 'Unknown'
      }
    end
  end
end

