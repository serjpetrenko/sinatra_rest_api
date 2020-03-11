# frozen_string_literal: true

module RequestSpecHelper
  def json
    JSON.parse(last_response.body, symbolize_names: true)
  end

  def auth_headers_for(user)
    post '/sessions', { password: '12341234', email: user.email }.to_json
    header 'AUTHORIZATION', json[:auth_token]
  end
end
