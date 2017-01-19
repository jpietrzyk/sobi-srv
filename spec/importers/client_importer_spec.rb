RSpec.describe ClientImporter do
  describe 'public instance methods' do
    it { expect(subject).to respond_to(:process!) }

    context '#process!' do
      let(:redis) { Communication.data }
      let(:keys) { %w(key1 key2 key3) }
      before do
        keys.each do |key|
          redis.set key, {
            bike_id: rand(1..100),
            token: generate_token
          }.to_json
        end
      end

      it 'imports client data to mysql db' do
        expect(Client.first.bike_id).to be_in(1..100)
        expect(Client.first.token.length).to eq(690)
      end

      it 'clears all client data from redis' do
        expect(subject.process!).to match_array(keys)
      end
    end
  end
end
