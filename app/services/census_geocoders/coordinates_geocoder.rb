require 'net/http'
require 'uri'
require 'json'

module CensusGeocoders
  class CoordinatesGeocoder

    def initialize (lat,long)
      y = URI.encode(lat)
      x = URI.encode(long)
      @url = URI.parse("https://geocoding.geo.census.gov/geocoder/geographies/coordinates?x=#{x}&y=#{y}&benchmark=Public_AR_Current&vintage=Current_Current&layers=54,84&format=json&key=#{ENV['CENSUS_BUREAU_API_KEY']}")
      @req = Net::HTTP::Get.new(@url.to_s)
    end

    def perform
      http = Net::HTTP.new(@url.host, @url.port)
      request = Net::HTTP::Get.new(@url.request_uri)
      http.use_ssl = true
      response = http.request(request)
      resHash = JSON.parse response.body
      geographies = resHash['result']['geographies']
      state = geographies['States'][0]['STUSAB']
      cd115 = geographies['115th Congressional Districts'][0]['CD115']
      district = cd115 != '00' ? cd115 : 1
      RepFinders::ByStateDistrict.new(state, district).perform
    end

  end
end
