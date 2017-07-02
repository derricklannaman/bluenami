class Organization < ApplicationRecord
  has_one :dashboard, dependent: :destroy
  has_many :users
  has_many :members, through: :users

  after_save :auto_create_dashboard

  def auto_create_dashboard
    Dashboard.create(organization_id: self.id)
  end

end
