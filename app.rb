# frozen_string_literal: true

require 'sinatra'
require 'shotgun'
require 'sinatra/json'
require 'jwt'

Dir.glob('./routes/api/v1/*.rb').each { |f| require f }

configure { set :server, :puma }

class SinatraApi < Sinatra::Application
  use API::V1::Base
  use API::V1::Users
  use API::V1::Sessions
end
