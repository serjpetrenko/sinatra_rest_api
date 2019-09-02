module API
  module Helpers
    module Authenticate
      def check_password(password, hash)
        BCrypt::Password.new(hash) == password
      end

      def user
        @user ||= User.find(email: json_params['email'])
      end

      def authenticate_token!
        payload = JsonWebToken.decode(auth_token)
        @current_user = User.find(payload['sub'])
      rescue JWT::ExpiredSignature
        halt 404, { errors: ['Auth token has expired'] }.to_json
      rescue JWT::DecodeError
        halt 404, { errors: ['Invalid auth token'] }.to_json
      end

      def auth_token
        @auth_token ||= request.env['HTTP_AUTHORIZATION']
      end

      private

      def token
        @token = JsonWebToken.encode(sub: user.id)
      end
    end
  end
end
