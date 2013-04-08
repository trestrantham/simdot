source 'https://rubygems.org'

ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

group :heroku do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

group :development do
  gem 'rails-erd'
  gem 'guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
end

group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'capybara', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
end

gem 'simple_form'
