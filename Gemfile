# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.2'

gem 'rails', '~> 7.1.2'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]
gem 'dotenv-rails'

gem 'fast_jsonapi'
gem 'active_model_serializers', '~> 0.10'

gem 'devise'
gem 'devise-jwt'

# DB and JWT management
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'nokogiri', force_ruby_platform: true
gem 'rack-cors'
gem 'redis', '~> 4.0'
gem 'sidekiq', '~> 7.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"ß

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"∂

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'rspec-rails'
  gem 'bundler-audit'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-nav'

  gem 'rubocop', require: false
  gem 'rubocop-performance', '~> 1.20'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end
