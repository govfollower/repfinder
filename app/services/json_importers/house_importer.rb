require 'json'

module JsonImporters
  class HouseImporter

    def initialize
      @file_path = Rails.root + "app/assets/json/house.json"
    end

    def perform
      return false unless @file_path
      house_json = JSON.parse File.read(@file_path)
      house_reps = house_json['results'][0]['members']
      house_reps.each do |rep|
        state = State.find_by(abbr: rep['state'])
        district = District.find_by(state_id: state.id, number: rep['district']) if state.present?
        if district
          district.create_house_rep!(
            first_name: rep['first_name'],
            middle_name: rep['middle_name'],
            last_name: rep['last_name'],
            party: rep['party'],
            phone: rep['phone'],
            twitter_account: rep['twitter_account'],
            facebook_account: rep['facebook_account'],
            propublica_id: rep['id'],
            began_office_at: began_office(rep['next_election'], rep['seniority']),
            ended_office_at: ended_office(rep['in_office']),
            reelection_date: reelection_year(rep['next_election'])
          )
        end
      end
      true
    end

    private

    def began_office(next_election, seniority)
      year_elected = next_election.to_i - (seniority.to_i - 1)
      Date.new(year_elected)
    end

    def ended_office(in_office)
      return in_office === 'true' ? nil : Date.new(2017)
    end

    def reelection_year(next_election)
      Date.new(next_election.to_i)
    end

  end
end
