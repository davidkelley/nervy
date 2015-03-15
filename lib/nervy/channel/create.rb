module Nervy
  class Channel
    class Create

      extend ActiveSupport::Autoload

      autoload :Response

      attr_reader :cipher

      delegate :key, :iv, to: :cipher

      def initialize
        @cipher = Cipher.new
      end

      def create!
        resp = connection.post('/') do |conn|
          conn.body = body
        end
        
        Response.new(cipher, resp)
      end

      def body
        {
          'key' => encrypted_key,
          'iv' => encrypted_iv
        }
      end

      def encrypted_key
        @encrypted_key ||= rsa.public_encrypt(key)
      end

      def encrypted_iv
        @encrypted_iv ||= rsa.public_encrypt(iv)
      end

      private

      def rsa
        @rsa ||= OpenSSL::PKey::RSA.new(connection.public_key)
      end

      def connection
        @connection ||= Connection.new
      end

    end
  end
end
