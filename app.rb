# frozen_string_literal: true

require 'sinatra'
require 'sinatra/namespace'
require 'shotgun'
require 'sinatra/json'
require 'jwt'

Dir.glob('./routes/api/v1/*.rb').each { |f| require f }
Dir.glob('./helpers/*.rb').each { |f| require f }

configure { set :server, :puma }

class SinatraApi < Sinatra::Application
  namespace '/api/v1' do
    before do
      content_type 'application/json'
      authenticate_token! unless request.path_info.include?('api/v1/sessions')
    end

    helpers API::Helpers::JsonParams
    helpers API::Helpers::Authenticate
    helpers API::Helpers::JsonWebToken
    register API::Routes::Users
    register API::Routes::Sessions
  end
end
