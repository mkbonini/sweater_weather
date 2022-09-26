class Forecast
  attr_reader :summary, :temperature

  def initialize(data)
    @summary = data[:weather].first[:description]  
    @temperature = data[:temp].round.to_s + " F"
  end
end