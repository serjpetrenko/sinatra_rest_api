# frozen_string_literal: true

require 'sinatra'
require 'sinatra/namespace'
require 'shotgun'
require 'sinatra/json'

Dir.glob('./routes/api/v1/*.rb').each { |f| require f }
Dir.glob('./helpers/*.rb').each { |f| require f }

configure { set :server, :puma }

class SinatraApi < Sinatra::Application
  namespace '/api/v1' do
    before do
      content_type 'application/json'
    end

    helpers API::Helpers::JsonParams
    register API::Routes::Users
  end
end
