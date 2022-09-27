require 'rails_helper'

RSpec.describe 'user api requests' do
  it 'Create User via post request' do
    user_params = 
      ({
        email: "Tom's",
        password: "3984 Red Cedar Dr, Highlands Ranch, CO 80126",
        confirm_password: "in the back"
      })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
    result = JSON.parse(response.body, symbolize_names: true)[:data]
    created_user = User.last

    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.api).to be_a(String)

    expect(response).to be_successful

    expect(result).to have_key(:id)
    expect(result[:id]).to be_a(String)
    expect(result[:type]).to eq("user")
    expect(result[:attributes]).to have_key(:email)
    expect(result[:attributes][:email]).to be_a(String)
    expect(result[:attributes]).to have_key(:api_key)
    expect(result[:attributes][:api_key]).to be_a(String)
  end

  it 'email is already taken' do

    user_params = {
      "email": "test@test.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
 
    headers = {"CONTENT_TYPE" => "application/json"}
 
    user_params_2 = {
      "email": "test@test.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params_2)
 
    expect(response).to_not be_successful
 
    data = JSON.parse(response.body, symbolize_names: true)
 
    expect(data).to have_key(:error)
    expect(data[:error]).to eq("email taken")
  end
 
  it 'password mismatch' do
 
    user_params = {
      "email": "test@test.com",
      "password": "password123",
      "password_confirmation": "password12345"
    }
 
    headers = {"CONTENT_TYPE" => "application/json"}
 
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
 
    data = JSON.parse(response.body, symbolize_names: true)
 
    expect(data).to have_key(:error)
    expect(data[:error]).to eq("password and confirmation mismatch")
  end
 
  it 'email format is invalid' do
 
    user_params = {
      "email": " ",
      "password": "test123",
      "password_confirmation": "test123"
    }
 
    headers = {"CONTENT_TYPE" => "application/json"}
 
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
 
    expect(response).to_not be_successful
 
    data = JSON.parse(response.body, symbolize_names: true)
 
    expect(data).to have_key(:error)
    expect(data[:error]).to eq("Invalid Email")
  end
end