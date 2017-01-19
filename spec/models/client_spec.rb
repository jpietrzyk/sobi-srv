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

  describe 'public class methods' do
    context 'executes methods correctly' do
      context 'self.import_clients_data' do
        let(:redis) { Communication.data }
        let(:keys) { ["key1", "key2", "key3"] }
        before do
          keys.each do |key|
            redis.set key, {
              bike_id: rand(1..100),
              token: generate_token
            }.to_json
          end
        end

        it 'imports client data to mysql db' do
          Client.import_clients_data!
          expect(Client.first.bike_id).to be_in(1..100)
          expect(Client.first.token.length).to eq(690)
        end

        it 'clears all client data from redis' do
          expect(Client.import_clients_data!).to match_array(keys)
        end
      end
    end
  end


end
