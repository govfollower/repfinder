class State < ApplicationRecord
  has_many :districts
  has_many :senate_reps
  has_many :house_reps, :through => :districts
end
