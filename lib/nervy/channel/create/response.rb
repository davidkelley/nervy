module Nervy
  class Channel
    class Create
      class Response

        attr_reader :cipher, :response

        def initialize(cipher, response)
          @cipher = cipher
          @response = response
        end

        def key
          cipher.key
        end

        alias_method :passphrase, :key

        def private_key
          @private_key ||= OpenSSL::PKey::RSA.new(cipher.decrypt(response.body), cipher.key).to_pem
        end

        def guid
          response.headers['X-Channel-ID']
        end

        alias_method :channel_id, :guid

      end
    end
  end
end
