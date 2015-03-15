require 'openssl'
require 'faraday'

require 'active_support/concern'
require 'active_support/dependencies/autoload'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/string/inflections'
require 'active_support/inflector'

require 'nervy/version'

module Nervy

  extend ActiveSupport::Autoload

  autoload :Channel
  autoload :Connection
  autoload :Cipher

  # @!attribute host
  #   @!scope class
  #   The host address of the Nervy.IO server.
  #   @return [String] Host address of Nervy.IO
  mattr_accessor :host
  self.host = nil

  # @!attribute port
  #   @!scope class
  #   The port number that Nervy.IO is listening on
  #   @return [String] Port number of Nervy.IO
  mattr_accessor :port
  self.port = nil

  # @!attribute cipher
  #   @!scope class
  #   @note This value is pre-configured to work against Nervy.IO
  #   The cipher that will be used to transfer ephemeral RSA Keys
  #   @return [String] Cipher algorithm
  mattr_accessor :cipher
  self.cipher = 'AES-256-CBC'

  # Helper to configure the Search module.
  #
  # @yield [Search] Yields the {Search} module.
  def self.configure
    yield self
  end

end

require 'nervy/railtie' if defined?(Rails)
