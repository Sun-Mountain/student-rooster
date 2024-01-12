# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.0'

gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'devise-async', '~> 1.0'
gem 'devise-security', '~> 0.18.0'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'redis', '>= 4.0.1'
gem 'sidekiq', '~> 7.2'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'sass-rails'
gem 'view_component'
gem 'font-awesome-sass', '~> 6.5.1'
gem 'dockerfile-rails', '>= 1.6', group: :development

group :development, :test do
  gem 'capybara', '>= 3.35.3'
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv-rails', '~> 2.8'
  gem 'factory_bot_rails', '>= 6.1.0'
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails', '>= 5.0.1'
end

group :development do
  gem 'letter_opener', '~> 1.8'
  gem 'letter_opener_web', '~> 2.0'
  gem 'rack-mini-profiler'
  gem 'rubocop', '~> 1.59'
  gem 'rubocop-performance', '~> 1.20'
  gem 'web-console'
end

group :test do
  gem 'fakefs', require: 'fakefs/safe'
  gem 'fakeredis'
end
