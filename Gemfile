source 'https://rubygems.org'

gemspec

if ENV['CI']
  rails_version = ENV['RAILS_VERSION'] || '7.1'
  eval_gemfile File.expand_path("../gemfiles/#{rails_version}.gemfile", __FILE__)
end
