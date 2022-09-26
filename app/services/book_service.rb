class BookService
  def self.conn
    Faraday.new(url: 'http://openlibrary.org') do |faraday|
      # faraday.params['appid'] = ENV['weather_api_key']
    end
  end
  def self.search_books(search)
    response = conn.get("/search.json?q=#{search}")
  end    
end