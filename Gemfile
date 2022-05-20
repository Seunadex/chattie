source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.5'

gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.1', '>= 5.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'redis', '~> 3.0'
gem "font-awesome-rails"
gem 'kramdown'
gem 'bootstrap'
gem 'devise'
gem 'jquery-rails'
gem 'devise-bootstrapped'
gem 'gemoji'
gem 'pry-rails'
gem 'client_side_validations'
gem "rails_best_practices"
gem 'rubocop-performance'
gem 'kramdown-parser-gfm', '~> 1.0', '>= 1.0.1'


group :development, :test do
  # gem 'pry'
  gem 'rb-readline'
  gem 'pry-remote'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.18', '>= 2.18.0'
  gem 'selenium-webdriver'
  gem "database_cleaner"
  gem "rspec-rails"
  gem 'factory_bot_rails'
  gem 'cucumber-rails', require: false
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rack-mini-profiler'
  gem 'chromedriver-helper'
  gem 'rubocop-rspec'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console', '>= 3.7.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'bullet'
  gem 'annotate'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
