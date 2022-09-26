class LocationService
  def self.conn
    Faraday.new(url: 'https://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['location_api_key']
    end
  end

  def self.get_location(location)
    conn.get("/geocoding/v1/address?location=#{location}&thumbMaps=false")
  end
end