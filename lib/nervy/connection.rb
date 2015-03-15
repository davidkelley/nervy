module Nervy
  class Connection

    attr_reader :conn

    delegate :get, :post, :put, :patch, :delete, to: :conn

    def initialize(&block)
      @conn = Faraday.new(url: "#{Nervy.host}:#{Nervy.port}", &block)
    end

    def public_key
      @public_key ||= get('/').body
    end

  end
end
