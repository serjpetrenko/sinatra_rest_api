# frozen_string_literal: true

Dir.glob('./helpers/*.rb').each { |f| require f }

module API
  module V1
    class Base < Sinatra::Application
      helpers API::Helpers::JsonParams
      helpers API::Helpers::Authenticate
      helpers API::Helpers::JsonWebToken

      before do
        content_type 'application/json'
        authenticate_token! unless request.path_info.include?('sessions')
      end
    end
  end
end
