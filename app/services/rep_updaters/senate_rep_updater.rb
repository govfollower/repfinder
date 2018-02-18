
module RepUpdaters
  class SenateRepUpdater

    def initialize (rep)
      @rep = rep
      @state = State.find_by(abbr: rep['state'])
    end

    def perform
      return false unless @state.present?

      saved_rep = SenateRep.find_by(propublica_id: @rep['id'])
      if saved_rep.present?
        update_rep(saved_rep)
      else
        create_rep
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

    def create_rep
      @state.senate_reps.create!(
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
