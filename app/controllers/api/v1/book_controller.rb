class Api::V1::BookController < ApplicationController
  def index
    render json: BookSerializer.new( BookFacade.search_books(params[:location], params[:quantity]))
  end
end
