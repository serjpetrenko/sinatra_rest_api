# frozen_string_literal: true

module API
  module Routes
    module Users
      def self.registered(app)
        app.get '/users' do
          user = { name: 'John', surname: 'Doe' }
          user.to_json
        end
      end
    end
  end
end
