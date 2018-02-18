require 'net/http'
require 'uri'
require 'json'

module CensusGeocoders
  class AddressGeocoder

    def initialize (address)
      @url = URI.parse("https://geocoding.geo.census.gov/geocoder/geographies/address?street=#{address[:street]}&city=#{address[:city]}&state=#{address[:state]}&benchmark=Public_AR_Current&vintage=Current_Current&layers=54,84&format=json&key=#{ENV['CENSUS_BUREAU_API_KEY']}")
      @req = Net::HTTP::Get.new(@url.to_s)
    end

    def perform
      http = Net::HTTP.new(@url.host, @url.port)
      request = Net::HTTP::Get.new(@url.request_uri)
      http.use_ssl = true  
      response = http.request(request)
      fmtResponse = JSON.parse response.body
      first_result = fmtResponse['result']['addressMatches'][0]
      state = first_result['addressComponents']['state']
      cd115 = first_result['geographies']['115th Congressional Districts'][0]['CD115']
      district = cd115 != '00' ? cd115 : 1
      RepFinders::ByStateDistrict.new(state, district).perform
    end

  end
end
