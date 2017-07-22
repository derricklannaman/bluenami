require 'rails_helper'
require 'pry-rails'
RSpec.describe Organization, type: :model do
  it 'is valid with a name' do
    org = Organization.new(name: 'Foo Party')
    expect(org).to be_valid
  end

  it 'is invalid without a name' do
    org = Organization.new(name: nil)
    org.valid?
    expect(org.errors[:name]).to include("can't be blank")
  end

  describe '.auto_create_dashboard' do
    it 'creates an organizational dashboard automatically on save' do
      org = Organization.new(id: 1, name: 'Foo Party')
      dashboard = Dashboard.new(organization_id: org.id)
      expect(dashboard.organization_id).to eq(org.id)
    end
  end
end
