RSpec.describe ClientImporter do
  describe 'public instance methods' do
    it { expect(subject).to respond_to(:process!) }

    context '#process!' do
      let(:mr) { MockRedis.new }
      let(:keys) { %w(key1 key2 key3) }
      before do
        keys.each do |key|
          mr.set key, {
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
        Communication.data = mr
        subject.process!
        
        expect(mr.keys.length).to eq(0)
      end
    end
  end
end
