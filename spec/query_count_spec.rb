RSpec.describe QueryCount do
  context 'QueryCount::Counter.counter' do
    before do
      User.create!(email: 'demo@example.com')
      QueryCount::Counter.reset_counter
    end

    it 'counts number of sql queries' do
      7.times { User.last }
      expect(QueryCount::Counter.counter).to eq 7
    end
  end
end
