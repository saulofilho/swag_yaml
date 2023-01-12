# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Use Config as the settings manager
gem 'config'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.4'
gem 'rails-healthcheck'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use Pundit as ACL
gem 'pundit'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'jwt'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use Rswag as the tool to generate OAS based on request specs
gem 'rswag-api', '~> 2.3'
gem 'rswag-ui', '~> 2.3'

group :production do
  gem 'stackdriver', '~> 0.21.1'
end

group :development, :test do
  gem 'awesome_print'
  gem 'factory_bot_rails'
  gem 'pry', '~> 0.13.1'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 6.0.1'
  gem 'rswag-specs', '~> 2.7'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.2'
  gem 'rubocop', '~> 1.4', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'faker'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'psych'
