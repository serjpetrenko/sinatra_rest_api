# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.6.3'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'bcrypt', require: 'bcrypt'
gem 'dotenv', require: 'dotenv'
gem 'jwt'
gem 'puma', '>= 4.3.1'
gem 'sequel', '>= 5'
gem 'sequel_pg', require: 'sequel'
gem 'shotgun'
gem 'sinatra', '~> 2.2'
gem 'sinatra-contrib', '~> 2.2'
gem 'sinatra-cross_origin'

group :development, :test do
  gem 'database_cleaner-sequel'
  gem 'pry-byebug', require: 'pry'
  gem 'rack-test'
  gem 'rspec'
end
