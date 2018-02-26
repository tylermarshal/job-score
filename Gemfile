source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'figaro','~> 1.1.1'
gem 'faraday'
gem 'omniauth-linkedin'
gem 'jquery-rails'
gem 'active_model_serializers', '~> 0.10.0'
gem "multi_json"
gem 'google-cloud-language'
gem 'google-cloud-vision'
gem 'newrelic_rpm'
gem 'redis-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'rspec-rails'
  gem 'capybara'
  gem "factory_bot_rails"
  gem 'database_cleaner'
end

# group :test do
#   gem 'vcr'
#   gem 'webmock'
# end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
