require 'rails_helper'

RSpec.describe Incumbent, type: :model do
  it 'is valid with a first name'
  it 'is valid with a last name'
  it 'has a party'
  it 'belongs to an office'
  it 'is not valid without a first name'
  it 'is not valid without a last name'
end
