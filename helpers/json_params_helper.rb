# frozen_string_literal: true

module API
  module Helpers
    module JsonParams
      def json_params
        @json_params ||= JSON.parse(request.body.read)
      rescue StandardError => e
        halt 400, { message: "Invalid JSON #{e}" }.to_json
      end
    end
  end
end
