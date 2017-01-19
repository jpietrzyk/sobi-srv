require 'rails_helper'
RSpec.describe Client, type: :model do
  it 'has a valid factory' do
    expect(build(:client)).to be_valid
  end

  let(:bike) { build(:client) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_presence_of(:bike_id) }

    it { is_expected.to allow_value(generate_token).for(:token) }
    it { is_expected.to_not allow_value('token').for(:token) }
    it { is_expected.to_not allow_value('string').for(:bike_id) }

    it { is_expected.to validate_length_of(:token).is_equal_to(690) }
  end
end
