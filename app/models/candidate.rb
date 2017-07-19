class Candidate < ApplicationRecord
  belongs_to :office
  scope :official_challenger, -> {where(challenger: true).first}
end
