source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.3.5'
# Use Puma as the app server
gem 'puma', '~> 5.6.4'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Routes
gem 'babosa', '~> 2.0.0'
gem 'friendly_id', '~> 5.4.2'

# Act as extensions
gem 'acts_as_list', '~> 1.0.4'

# API
gem 'jsonapi-serializer', '~> 2.2.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.11.1', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'debug', '~> 1.5.0', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.20.0'
  gem 'rspec-rails', '~> 5.1.1'
end

group :development do
  gem 'bullet', '~> 7.0.1'
  gem 'rubocop', '~> 1.26.1'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0.1'
  gem 'shoulda-matchers', '~> 5.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
