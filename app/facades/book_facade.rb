class BookFacade
  def self.search_books(location, quantity)
    lat_lon = LocationService.get_location(location)

    weather = WeatherService.get_weather(lat_lon[:lat], lat_lon[:lon])
    forecast = Forecast.new(weather[:current])

    book_results = BookService.search_books(location)
    number_of_results = book_results[:numFound]
    books = []
    book_results[:docs].first(quantity.to_i).each do |book|
      books << Book.new(book)
    end

    BookResults.new([location, forecast, number_of_results, books])
  end
end