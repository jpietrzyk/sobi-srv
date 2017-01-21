RSpec.describe ClientSubscriber do
  describe 'public instance methods' do
    context '#process!' do
      let(:payload) do
        {
          bike_id: rand(1..100),
          token: generate_token
        }.to_json
      end

      it 'imports client data to mysql db' do
        expect(Client.first.bike_id).to be_in(1..100)
        expect(Client.first.token.length).to eq(690)
      end
    end
  end
end
