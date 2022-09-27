class Api::V1::UsersController < ApplicationController
  def create
    render json: UserSerializer.new( user = User.create!(user_params) )
  end

  private
  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end
