# frozen_string_literal: true

namespace :db do
  desc 'Seed db with '
  task :seed, [:version] do
    require 'sequel'
    require 'dotenv'
    require_relative '../records/users'
    require_relative '../../config/boot'

    env = ENV['RACK_ENV'] || 'development'
    Dotenv.load(['.env', env].compact.join('.'), '.env')

    db = Sequel.connect(ENV.fetch('DATABASE_URL'))

    puts "Insert #{USERS.size} users"
    db[:users].multi_insert(USERS)
  end
end
