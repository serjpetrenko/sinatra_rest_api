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
gem 'sinatra', '~> 2.0', '>= 2.0.8.1'
gem 'sinatra-contrib', '~> 2.0', '>= 2.0.8.1'
gem 'sinatra-cross_origin'

group :development, :test do
  gem 'pry-byebug', require: 'pry'
end
