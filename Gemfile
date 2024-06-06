source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 6.1.7', '>= 6.1.7.8'

gem 'puma', '~> 4.3', '>= 4.3.12'
gem 'sass-rails', '~> 6.0', '>= 6.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 5.0', '>= 5.0.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.9', '>= 2.9.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'redis', '~> 3.0'
gem "font-awesome-rails"
gem 'kramdown'
gem 'bootstrap', '>= 5.3.0'
gem 'devise', '>= 4.9.3'
gem 'jquery-rails', '>= 4.6.0'
gem 'devise-bootstrapped'
gem 'gemoji'
gem 'pry-rails'
gem 'client_side_validations', '>= 22.0.0'
gem "rails_best_practices"
gem 'rubocop-performance'
gem 'kramdown-parser-gfm', '~> 1.1', '>= 1.1.0'


group :development, :test do
  # gem 'pry'
  gem 'rb-readline'
  gem 'pry-remote'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.18', '>= 2.18.0'
  gem 'selenium-webdriver'
  gem "database_cleaner"
  gem "rspec-rails", ">= 6.0.2"
  gem 'factory_bot_rails', '>= 6.3.0'
  gem 'cucumber-rails', '>= 3.0.0', require: false
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rack-mini-profiler'
  gem 'chromedriver-helper'
  gem 'rubocop-rspec'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console', '>= 4.2.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'bullet'
  gem 'annotate'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
