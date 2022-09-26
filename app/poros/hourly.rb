class Hourly
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(data)
    @time = Time.at(data[:dt])
    @temperature = data[:temp]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end