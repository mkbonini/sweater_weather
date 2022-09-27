class Api::V1::UsersController < ApplicationController
  def create
    render json: UserSerializer.new( user = User.create!(user_params) )
  end

  def show  
    user = User.find_by(email: user_params[:email])
    if user.authenticate(user_params[:password])
      render json: UserSerializer.new( user )
    else
      binding.pry
    end
  end

  private
  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end
