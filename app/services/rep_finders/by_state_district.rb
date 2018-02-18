require 'json'

module RepFinders
  class ByStateDistrict

    def initialize (abbr, district_no)
      @state = State.find_by(abbr: abbr)
      @district = District.find_by(state_id: @state.id, number: district_no.to_i) if @state.present?
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
