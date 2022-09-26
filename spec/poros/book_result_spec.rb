RSpec.describe BookResults do
  it "exists and has attributes" do
    book_results = BookService.search_books('denver,co')
    number_of_results = book_results[:numFound]
    books = []
    book_results[:docs].first(5).each do |book|
      books << Book.new(book)
    end
    weather = WeatherService.get_weather(39.738453, -104.984853)
    forecast = Forecast.new(weather[:current])

    data = ["denver,co", forecast, number_of_results, books ]

    br = BookResults.new(data)

    expect(br).to be_a BookResults
    expect(br.destination).to eq('denver,co')
    expect(br.total_books_found).to eq(47113)
    expect(br.books).to be_a Array
    expect(br.books.count).to eq(5)
  end
end