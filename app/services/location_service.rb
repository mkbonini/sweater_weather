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

  def self.get_route_time(origin, destination)
    response = conn.get("/directions/v2/route") do |f|
      f.params['from'] = origin
      f.params['to'] = destination
      f.params['outFormat'] = 'json'
      f.params['ambiguities'] = 'ignore'
      f.params['routeType'] = 'fastest'
      f.params['doReverseGeocode'] = 'false'
      f.params['avoidTimedConditions'] = 'false'
    end

    trip = JSON.parse(response.body, symbolize_names: true)
    if trip[:info][:statuscode] != 402
      trip[:route][:time]
    else
      "impossible route"
    end
  end
end