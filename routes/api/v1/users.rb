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
      end
    end
  end
end
