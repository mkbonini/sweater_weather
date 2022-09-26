class BookResults
  attr_reader :id, :destination, :forecast, :total_books_found, :books

  def initialize(data)
    @id = nil
    @destination = data[0]
    @forecast = data[1]
    @total_books_found = data[2]
    @books = data[3]
  end
end