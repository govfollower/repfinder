require 'net/http'
require 'json'

module PropublicaApi
  class GetHouseRepByStateDistrict

    def initialize (state, district)
      @state = state
      @district = district
      return false unless @district.present?
    end

    def perform
      url = URI.parse("https://api.propublica.org/congress/v1/members/house/#{@state.abbr}/#{@district.number}/current.json")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url.request_uri)
      request.add_field("X-API-Key", "#{ENV['PROPUBLICA_API_KEY']}")

      response = http.request(request)
      response_as_hash = JSON.parse response.body
      return house_rep_hash(response_as_hash)
    end

    private

    def house_rep_hash(response)
      puts response
      results = response['results']
      return results[0]
    end

  end
end
