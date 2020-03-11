# frozen_string_literal: true

module RequestSpecHelper
  def json
    JSON.parse(last_response.body, symbolize_names: true)
  end
end
