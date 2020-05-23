# Query Count

[![Gem Version](https://badge.fury.io/rb/query_count.svg)](https://badge.fury.io/rb/query_count)
[![Build Status](https://travis-ci.com/rubysamurai/query_count.svg?branch=master)](https://travis-ci.com/rubysamurai/query_count)

Counts the number of SQL queries performed by the ActiveRecord.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'query_count'
```

Run `$ bundle install`

## Usage

The gem will automatically include the number of SQL queries  to the Rails log.

```
ActiveRecord: 34.0ms | SQL Queries: 8 (1 cached)
```

This log example shows that the total number of queries was 8 and 1 of those queries was cached. Meaning that the database was hit 7 times.

`QueryCount::Counter` provides public methods `counter`, `counter_cache`, `reset_counter`, `reset_counter_cache` to use, for instance, in rake tasks and tests.

RSpec 3 example:

```
it 'performs exactly 5 queries' do
  QueryCount::Counter.reset_counter
  5.times { User.last }
  expect(QueryCount::Counter.counter).to eq 5
end
```

## License

`query_count` © Dmitriy Tarasov. Released under the [MIT](LICENSE.txt) license.
