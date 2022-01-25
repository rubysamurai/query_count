# Query Count

[![Gem Version](https://badge.fury.io/rb/query_count.svg)](https://badge.fury.io/rb/query_count)
[![CI](https://github.com/rubysamurai/query_count/workflows/CI/badge.svg)](https://github.com/rubysamurai/query_count/actions?query=workflow%3ACI)

A zero-configuration gem to count the number of SQL queries performed by the ActiveRecord.
Supports **Rails 4.2+** and **Ruby 2.0+** (the complete testing matrix is [here](.github/workflows/ci.yml)).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'query_count'
```

Run `bundle install`.

## Usage

The gem will automatically include the number of SQL queries to the default Rails log.

```
ActiveRecord: 34.0ms | SQL Queries: 8 (1 cached)
```

This log example shows that the total number of queries was 8, and 1 was cached, which means the request hit the database 7 times.

`QueryCount::Counter` provides public methods `counter`, `counter_cache`, `reset_counter`, `reset_counter_cache`.

RSpec 3 example:

```ruby
it 'performs exactly 5 queries' do
  QueryCount::Counter.reset_counter
  5.times { User.last }
  expect(QueryCount::Counter.counter).to eq 5
end
```

## License

`query_count` © Dmitriy Tarasov. Released under the [MIT](LICENSE.txt) license.
