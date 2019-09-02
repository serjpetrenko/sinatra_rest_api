# frozen_string_literal: true

module API
  module Routes
    module Sessions
      def self.registered(app)
        app.post '/sessions' do
          user = User.find(email: json_params['email'])
          if user && check_password(json_params['password'], user.password_digest)
            { user: user, auth_token: token }.to_json
          else
            halt 404, { error: "Can't authenticate try again" }.to_json
          end
        end
      end
    end
  end
end
