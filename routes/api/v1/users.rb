# frozen_string_literal: true

module API
  module Routes
    module Users
      def self.registered(app)
        app.get '/users' do
          User.all.to_json
        end

        app.get '/users/:id' do
          user = User[params[:id]]
          user.to_json
        end

        app.post '/users' do
          user = User.new(json_params)
          if user.save
            user.to_json
            status 201
          else
            status 422
            user.to_json
          end
        end

        app.put '/users/:id' do
          user = User[params[:id]]
          if user.update(json_params)
            user.to_json
          else
            status 422
            user.to_json
          end
        end

        app.delete '/users/:id' do
          user = User[params[:id]]
          user.destroy
          status 204
        end
      end
    end
  end
end
