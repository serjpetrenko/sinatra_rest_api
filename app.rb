# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'jwt'

Dir.glob('./routes/api/v1/*.rb').sort.each { |f| require f }

configure { set :server, :puma }

class SinatraApi < Sinatra::Application
  not_found { { message: 'Route not found' }.to_json }

  use API::V1::Base
  use API::V1::Users
  use API::V1::Sessions
end
