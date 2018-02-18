require 'net/http'
require 'json'

module PropublicaApi
  class GetAllHouseReps

    def initialize (as_models)
      @as_models = as_models == true
    end

    def perform
      url = URI.parse("https://api.propublica.org/congress/v1/115/house/members.json")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url.request_uri)
      request.add_field("X-API-Key", "#{ENV['PROPUBLICA_API_KEY']}")

      response = http.request(request)
      response_as_hash = JSON.parse response.body

      results = response_as_hash['results'][0]
      members = results['members']
      if @as_models
        return reps_as_models(members)
      else
        return members
      end
    end

    private

    def reps_as_models(reps)
      reps.map { |r|
        m = HouseRep.new
        m.propublica_id = r['id']
        m.first_name = r['first_name']
        m.middle_name = r['middle_name']
        m.last_name = r['last_name']
        m.party = r['party']
        m.dob = r['date_of_birth']
        m.phone = r['phone']
        m.contact_form_url = r['contact_form']
        m.website_url = r['url']
        m.twitter_account = r['twitter_account']
        m.facebook_account = r['facebook_account']
        m.in_office = r['in_office']
        m
      }
    end

  end
end
