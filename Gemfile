source 'https://rubygems.org'
ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.0'
gem 'sprockets', '~> 3.7.2'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'dotenv'

# linterz
gem 'ruby-lint'
gem 'scss-lint'
gem 'rubocop'
gem 'brakeman'

gem 'github_api', '~> 0.15.0'
gem 'github_webhook', '~> 1.0.3'
gem 'omniauth'
gem 'omniauth-github'
gem 'devise'
gem 'execjs'
gem 'therubyracer'

gem 'lograge'

gem 'puma'

gem 'git_diff_parser'
gem 'httparty'
gem 'colorize'
gem 'ruby-terminfo'
gem 'filewatcher'

gem 'chronic'
gem 'business_time'
gem 'holidays'

gem 'breakpoint'

group :staging, :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'rspec-rails'
  gem 'simplecov'
end

group :test do
  gem 'rails-controller-testing'
end

# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 3.5.1', group: 'development'
