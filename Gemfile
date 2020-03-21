source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "6.0.2.2"
gem "puma", "~> 4.1"
gem "pg", ">= 0.18"
gem 'dotenv-rails', require: "dotenv/rails-now"
gem "bootsnap", ">= 1.4.2", require: false
gem "sassc-rails"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"
gem "lograge"

gem "rack-canonical-host", "~> 0.2.3"

group :development do
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "simplecov", require: false
  gem "rubocop", ">= 0.70.0", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "letter_opener"

  # Required in Rails 5 by ActiveSupport::EventedFileUpdateChecker
  gem "listen", ">= 3.0.5"
  gem "overcommit", ">= 0.37.0", require: false
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "pry-byebug"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "mock_redis"
  gem "selenium-webdriver"
  gem "webdrivers"

gem "lighthouse-matchers"
gem "axe-matchers"
end

gem 'sidekiq'
gem 'redis'