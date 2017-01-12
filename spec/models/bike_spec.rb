require 'rails_helper'

RSpec.describe Bike, type: :model do
  it 'is valid with valid attributes' do
    expect(Bike.new(token: token)).to be_valid
  end

  it 'is not valid without a token' do
    bike = Bike.new(token: nil)
    expect(bike).to_not be_valid
  end

  it 'is not valid with wrong token length' do
    bike = Bike.new(token: token(666))
    expect(bike).to_not be_valid
  end
end
