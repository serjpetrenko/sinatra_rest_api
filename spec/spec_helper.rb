# frozen_string_literal: true

require 'rack/test'
require 'rspec'
require 'database_cleaner-sequel'

env = 'test'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, env)

Dotenv.load(['.env', env].compact.join('.'), '.env')

ENV['RACK_ENV'] = 'test'

require File.expand_path('../app.rb', __dir__)

# Configure Sequel
DB = Sequel.connect(ENV.fetch('TEST_DATABASE_URL'), max_connections: ENV['POOL_SIZE'])

# Require models
Dir.glob('./models/*.rb').sort.each { |f| require f }

# Require support helpers
Dir.glob('./spec/support/*.rb').sort.each { |f| require f }

# Configure database_cleaner
DatabaseCleaner[:sequel, { connection: DB }]

module RSpecMixin
  include Rack::Test::Methods

  def app
    SinatraApi
  end
end

# For RSpec 2.x and 3.x
RSpec.configure do |config|
  config.include RSpecMixin
  config.include RequestSpecHelper
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
