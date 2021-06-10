RSpec.describe QueryCount do
  context 'QueryCount::Counter.counter' do
    before do
      User.create!(email: 'demo@example.com')
      QueryCount::Counter.reset_counter
    end

    it 'counts number of sql queries' do
      (1..100).each do |n|
        QueryCount::Counter.reset_counter
        n.times { User.last }
        expect(QueryCount::Counter.counter).to eq n
      end
    end
  end
end
