module Nervy
  class Cipher

    attr_reader :key, :iv

    def initialize(mode = :decrypt, key = nil, iv = nil)
      cipher.send(mode)
      @key = cipher.key = key || cipher.random_key
      @iv = cipher.iv = iv || cipher.random_iv
    end

    def decrypt(text)
      cipher.update(text) + cipher.final
    end

    alias_method :encrypt, :decrypt

    private

    def cipher
      @cipher ||= OpenSSL::Cipher.new(Nervy.cipher)
    end

  end
end
