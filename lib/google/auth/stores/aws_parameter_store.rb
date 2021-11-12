require "googleauth/token_store"

module Google
  module Auth
    module Stores
      class AwsParameterStore < ::Google::Auth::TokenStore
        VERSION = "0.1.0"
        DEFAULT_KEY_PREFIX = "Google::Auth::Stores::AwsParameterStore::"

        def initialize(options = {})
          super()

          @client = options.delete (:client)

          prefix = options.delete :prefix
          @prefix = prefix || DEFAULT_KEY_PREFIX
        end

        def load(id)
          key = key_for(id)
          @client.get_parameter(name: key, with_decryption: true)&.parameter&.value
        rescue
          nil
        end

        def store(id, token)
          key = key_for(id)
          @client.put_parameter(name: key, value: token, type: 'SecureString', overwrite: true)
        end

        def delete(id)
          key = key_for(id)
          @client.delete_parameter(name: key)
        end

        def key_for(id)
          @prefix + id
        end
      end
    end
  end
end
