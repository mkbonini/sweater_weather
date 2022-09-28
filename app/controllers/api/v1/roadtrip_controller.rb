class Api::V1::RoadtripController < ApplicationController
  def show  
    user = User.find_by(api_key: roadtrip_params[:api_key])

    render json: RoadtripSerializer.new( RoadtripFacade.get_roadtrip(roadtrip_params) )
    #  RoadtripFacade.get_roadtrip(roadtrip_params) 
  end

  private
  def roadtrip_params
    params[:road_trip].permit(:origin, :destination, :api_key)
  end
end