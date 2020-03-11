# frozen_string_literal: true

namespace :db do
  require 'sequel'
  require 'dotenv'

  env = ENV['RACK_ENV'] || 'development'
  Dotenv.load(['.env', env].compact.join('.'), '.env')

  Sequel.extension(:migration)

  desc 'Run migrations for test'
  namespace :test do
    task :migrate do
      db = Sequel.connect(ENV.fetch('TEST_DATABASE_URL'))
      puts 'Migrating to latest'
      Sequel::Migrator.run(db, 'db/migrations')
    end
  end

  desc 'Run migrations for development'
  namespace :development do
    task :migrate, [:version] do |_t, args|
      db = Sequel.connect(ENV.fetch('DATABASE_URL'))

      if args[:version]
        puts "Migrating to version #{args[:version]}"
        Sequel::Migrator.run(db, 'db/migrations', target: args[:version].to_i)
      else
        puts 'Migrating to latest'
        Sequel::Migrator.run(db, 'db/migrations')
      end
    end
  end
end
