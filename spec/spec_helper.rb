ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('support/dummy_rails_app/config/environment.rb', __dir__)

require 'bundler/setup'
require 'query_count'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    ActiveRecord::Schema.verbose = false
    migration_path = 'spec/support/dummy_rails_app/db/migrate'
    if ActiveRecord::VERSION::STRING.to_f >= 6.0
      ActiveRecord::MigrationContext.new(migration_path, ActiveRecord::SchemaMigration).migrate
    elsif ActiveRecord::VERSION::STRING.to_f >= 5.2
      ActiveRecord::MigrationContext.new(migration_path).migrate
    else
      ActiveRecord::Migrator.migrate(migration_path)
    end
  end

  config.after(:suite) do
    FileUtils.rm('spec/support/dummy_rails_app/db/query_test.db')
  end
end
