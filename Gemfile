source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'yaml_db'
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "haml-rails", "~> 0.9"

gem 'puma'

gem 'redis'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-rack-cache'

gem 'dotenv-rails', groups: [:development, :test]

gem 'validates_type'

gem 'sidetiq'

gem 'foreman'

gem 'rubocop', '~> 0.46.0', require: false

gem 'bootstrap', '~> 4.0.0.alpha6'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'timecop'
  gem "mock_redis"
end

group :test do
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
