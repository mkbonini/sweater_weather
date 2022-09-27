class LocationService
  def self.conn
    Faraday.new(url: 'https://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['location_api_key']
    end
  end

  def self.get_location(location)
    response = conn.get("/geocoding/v1/address?location=#{location}&thumbMaps=false")
    lat_lon = JSON.parse(response.body, symbolize_names: true)

    lat = lat_lon[:results][0][:locations][0][:latLng][:lat]
    lon = lat_lon[:results][0][:locations][0][:latLng][:lng]

    reply = {lat: lat, lon: lon}
  end
end