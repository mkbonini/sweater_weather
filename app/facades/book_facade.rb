class BookFacade
  def self.search_books(location, quantity)
    reply = LocationService.get_location(location)
    lat_lon = JSON.parse(reply.body, symbolize_names: true)
    lat = lat_lon[:results][0][:locations][0][:latLng][:lat]
    lon = lat_lon[:results][0][:locations][0][:latLng][:lng]

    weather = WeatherService.get_weather(lat, lon)
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