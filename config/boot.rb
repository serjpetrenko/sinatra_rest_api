# frozen_string_literal: true

env = ENV['RACK_ENV'] || 'development'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, env)

Dotenv.load(['.env', env].compact.join('.'), '.env')

require_relative 'models'
require_relative '../app'
