# frozen_string_literal: true

require_relative 'db'

Sequel::Model.cache_associations = false if ENV['RACK_ENV'] == 'development'
Sequel::Model.plugin(:json_serializer)
Sequel::Model.plugin(:timestamps)
Sequel::Model.plugin(:uuid)

Dir.glob('./models/*.rb').each { |f| require f }
