class District < ApplicationRecord
  belongs_to :state
  has_many :house_reps
end
