class Office < ApplicationRecord
  has_many :candidates, dependent: :destroy
  has_one :incumbent, dependent: :destroy
  belongs_to :voter_guide
end
