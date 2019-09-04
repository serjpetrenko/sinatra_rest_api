# frozen_string_literal: true

module API
  module V1
    class Users < Base
      get '/users' do
        User.to_json(except: :password_digest)
      end

      get '/users/:id' do
        user = User[params[:id]]
        user.to_json(except: :password_digest, include: :posts)
      end

      post '/users' do
        user = User.new(json_params)
        if user.save
          status 201
          user.to_json(except: :password_digest)
        else
          halt 422, user.to_json
        end
      end

      put '/users/:id' do
        user = User[params[:id]]
        if user.update(json_params)
          user.to_json
        else
          halt 422, user.to_json
        end
      end

      delete '/users/:id' do
        user = User[params[:id]]
        user.destroy
        status 204
      end
    end
  end
end
