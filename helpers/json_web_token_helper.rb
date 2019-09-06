# frozen_string_literal: true

require 'time'

module API
  module Helpers
    module JsonWebToken
      def self.encode(payload, exp = one_day)
        payload[:exp] = exp.to_i
        JWT.encode(payload, ENV['SECRET_KEY'])
      end

      def self.decode(token)
        JWT.decode(token, ENV['SECRET_KEY']).first
      end

      def self.one_day
        Time.now + (24 * 60 * 60)
      end
    end
  end
end
