require 'rails_helper'

RSpec.describe BookService do
  it "makes an api call and returns a list of books by subject" do
    response = BookService.search_books('denver,co')

    expect(response).to be_a(Hash)
    expect(response[:docs]).to be_a(Array)
    expect(response[:numFound]).to be_a(Integer)
  end
end