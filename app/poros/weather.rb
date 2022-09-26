class Weather
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @id = nil
    @current_weather = data[0]
    @daily_weather = data[1]
    @hourly_weather = data[2]
  end
end