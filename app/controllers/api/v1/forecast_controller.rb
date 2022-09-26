class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new( WeatherFacade.full_weather(params[:location]))
    # WeatherFacade.full_weather(params[:location])
  end
end
