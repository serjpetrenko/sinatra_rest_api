# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.6.3'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'dotenv', require: 'dotenv'
gem 'puma'
gem 'sequel', '>= 5'
gem 'sequel_pg', require: 'sequel'
gem 'shotgun'
gem 'sinatra', '~> 2.0.7'
gem 'sinatra-contrib'

group :development, :test do
  gem 'pry-byebug', require: 'pry'
end
