require 'rails_helper'

RSpec.describe "Book Request" do 
  it 'finds books about a location' do

    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:id]).to eq(nil)
    expect(result[:type]).to eq("books")

    expect(result[:attributes]).to have_key(:destination)
    expect(result[:attributes][:forecast]).to be_a(Hash)
    expect(result[:attributes]).to have_key(:total_books_found)
    expect(result[:attributes][:books]).to be_a(Array)
    expect(result[:attributes][:books].count).to eq(5)
  end
end