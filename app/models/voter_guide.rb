class VoterGuide < ApplicationRecord
  has_many :offices, dependent: :destroy
  belongs_to :organization
end
