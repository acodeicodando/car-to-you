source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'mysql', '~> 2.9'
  gem 'rubocop'
  gem 'ruby-debug-ide'
end

group :test do
  gem 'action-cable-testing', '~> 0.6.1'
  gem 'database_cleaner-active_record', '~> 1.8'
  gem 'database_cleaner-redis', '~> 1.8'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'rspec-collection_matchers', '~> 1.2'
  gem 'rspec-mocks', '~> 3.10'
  gem 'rspec-rails', '~> 4.0'
  gem 'simplecov', '~> 0.19.1'
  gem 'solargraph', '~> 0.39.17'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # custom gems
  gem 'guard'
  gem 'guard-rspec', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# custom gems
gem 'cable_ready', '~> 4.3'
gem 'devise', '~> 4.7'
gem 'faker', '~> 2.14'
# gem 'pg', '~> 1.2'
gem 'redis', '~> 4.2'
gem 'simple_calendar', '~> 2.4'
gem 'stimulus_reflex', '~> 3.3'
