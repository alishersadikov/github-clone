To setup the project:
  rails new my_app -d postgresql --skip-test-unit --skip-spring -T


RSpec setup:

  - in Gemfile:
    group :development, :test do
      gem 'rspec-rails'
    end
  - from terminal:
      rails generate rspec:install

Capybara setup:
  - in Gemfile:
    gem 'capybara'
  - in rails_helper.rb:
    require 'capybara/rails'

Figaro setup:
  - in Gemfile:
    gem 'figaro'
  - from terminal:
    bundle exec figaro install
