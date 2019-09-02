# frozen_string_literal: true

DB =
  Sequel::DATABASES.first ||
  Sequel.connect(ENV.fetch('DATABASE_URL'), max_connections: ENV['POOL_SIZE'])
