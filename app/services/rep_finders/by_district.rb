require 'json'

module RepFinders
  class ByDistrict

    def initialize (district)
      @district = district
      @state = State.find(district.state_id)
    end

    def perform
      house_rep = HouseRep.find_by(district_id: @district.id, in_office: true).as_representative
      senate_reps = SenateRep.where(state_id: @state.id).map { |rep| rep.as_representative }
      reps = {
        state: @state,
        district: @district,
        house: house_rep,
        senate: senate_reps
      }
      return reps
    end

  end
end
