require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it 'is valid with a first name'
  it 'is valid with a last name'
  it 'had a party'
  it 'is not valid without a first name'
  it 'is not valid without a last name'
  it 'is not the official nominee'
  it 'is selected the official nominee'
end
