# Query Count

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

## License

`query_count` © Dmitriy Tarasov. Released under the [MIT](LICENSE.txt) license.
