require "jwt"

module Jwtcli
  EMAIL_REGEXP = /\A\w+@\w+\.\w+\Z/

  class Gen
    def initialize(payload)
      @payload = payload
      raise ArgumentError, 'Argument `payload` is required' unless @payload && @payload.is_a?(Hash)
      raise ArgumentError, 'Payload key `user_id` is required' unless @payload[:user_id] && @payload[:user_id] != ''
      raise ArgumentError, 'Payload key `email` is required' unless @payload[:email] && @payload[:email] != ''
      raise ArgumentError, 'Invalid email' unless @payload[:email] =~ EMAIL_REGEXP
    end

    def encode
      JWT.encode(@payload, nil, 'none')
    end
  end
end
