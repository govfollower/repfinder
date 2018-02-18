
module RepUpdaters
  class HouseRepUpdater

    def initialize (rep)
      @rep = rep
      @state = State.find_by(abbr: rep['state'])
      number = rep['district'] == 'At-Large' ? 1 : rep['district']
      @district = @state.present? ? District.find_by(state_id: @state.id, number: number) : false
    end

    def perform
      return false unless @district.present?
      saved_rep = HouseRep.find_by(propublica_id: @rep['id'])
      saved_district_rep = HouseRep.find_by(district_id: @district.id)

      if saved_rep.present?
        update_rep(saved_rep)
      else
        create_rep
      end

      if saved_district_rep.present?
        update_saved_district_rep(saved_district_rep)
      end

      return true
    end

    private

    def update_rep(rep)
      rep.update!(
        first_name: @rep['first_name'],
        middle_name: @rep['middle_name'],
        last_name: @rep['last_name'],
        party: @rep['party'],
        dob: @rep['date_of_birth'],
        phone: @rep['phone'],
        contact_form_url: @rep['contact_form'],
        website_url: @rep['url'],
        twitter_account: @rep['twitter_account'],
        facebook_account: @rep['facebook_account'],
        in_office: @rep['in_office'],
        reelection_year: @rep['next_election']
      )
    end

    def update_saved_district_rep(rep)
      return false unless @rep['in_office'] == true
      if @rep['id'] != rep['propublica_id']
        rep.update(
          in_office: false
        )
      end
    end

    def create_rep
      @district.house_reps.create!(
        propublica_id: @rep['id'],
        first_name: @rep['first_name'],
        middle_name: @rep['middle_name'],
        last_name: @rep['last_name'],
        party: @rep['party'],
        dob: @rep['date_of_birth'],
        phone: @rep['phone'],
        contact_form_url: @rep['contact_form'],
        website_url: @rep['url'],
        twitter_account: @rep['twitter_account'],
        facebook_account: @rep['facebook_account'],
        in_office: @rep['in_office'],
        reelection_year: @rep['next_election']
      )
    end

  end
end
