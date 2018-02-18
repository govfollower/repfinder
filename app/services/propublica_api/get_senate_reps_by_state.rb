require 'net/http'
require 'json'

module PropublicaApi
  class GetSenateRepsByState

    def initialize (state)
      @state = state
      return false unless @state.present?
    end

    def perform
      url = URI.parse("https://api.propublica.org/congress/v1/members/senate/#{@state.abbr}/current.json")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url.request_uri)
      request.add_field("X-API-Key", "#{ENV['PROPUBLICA_API_KEY']}")

      response = http.request(request)
      response_as_hash = JSON.parse response.body
      return response_as_hash
    end

  end
end
