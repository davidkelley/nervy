module Nervy
  class Channel

    extend ActiveSupport::Autoload

    autoload :Create

    attr_reader :id, :private_key

    def initialize(id, private_key)
      @id = id
      @private_key = private_key
    end

    def publish(path, payload)
      resp = connection.post("/#{id}/#{path}") do |req|
        req.headers['Content-Type'] = 'text/plain'
        req.body = encrypt(payload)
      end
      resp.status == 204
    end

    def encrypt(text)
      rsa.private_encrypt(text)
    end

    def self.create!
      Create.new.create!
    end

    def self.from_response(resp)
      self.new resp.guid, resp.private_key
    end

    private

    def connection
      @connection ||= Connection.new
    end

    def rsa
      @rsa ||= OpenSSL::PKey::RSA.new(private_key)
    end

  end
end
