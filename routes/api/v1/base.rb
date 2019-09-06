# frozen_string_literal: true

require 'sinatra/cross_origin'
Dir.glob('./helpers/*.rb').each { |f| require f }

module API
  module V1
    class Base < Sinatra::Application
      helpers API::Helpers::JsonParams
      helpers API::Helpers::Authenticate
      helpers API::Helpers::JsonWebToken

      configure { enable :cross_origin }

      options '*' do
        response.headers['Allow'] = 'GET, PUT, POST, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token'
        response.headers['Access-Control-Allow-Origin'] = '*'
        200
      end

      before do
        content_type :json
        response.headers['Access-Control-Allow-Origin'] = '*'
        authenticate_token! unless request.path_info.include?('sessions')
      end
    end
  end
end
