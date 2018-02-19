class State < ApplicationRecord
  has_many :districts
  has_many :senate_reps
  has_many :house_reps, :through => :districts

  # def as_json(options={})
  #   super.as_json(options).merge({districts: districts})
  # end

  # def districts
  #   District.where(state_id: self.id).order(:number)
  # end
end
