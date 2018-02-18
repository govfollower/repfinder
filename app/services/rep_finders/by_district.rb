require 'json'

module RepFinders
  class ByDistrict

    def initialize (district)
      @district = district
      @state = State.find(district.state_id)
    end

    def perform
      return false unless @district
      house_rep = HouseRep.find_by(district_id: @district.id, in_office: true).as_representative
      senate_reps = SenateRep.where(state_id: @state.id).map { |rep| rep.as_representative }
      reps = {
        district: {
          name: @state.name,
          abbr: @state.abbr,
          number: @district.number
        },
        house: house_rep,
        senate: senate_reps
      }
      return reps
    end

  end
end
