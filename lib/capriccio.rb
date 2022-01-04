# frozen_string_literal: true

require_relative 'capriccio/version'
require_relative 'capriccio/runtime/object'
require_relative 'capriccio/runtime/message'
require_relative 'capriccio/runtime/method'
require_relative 'capriccio/runtime/bootstrap'

module CapriccIo
  class Error < RuntimeError
    attr_accessor :current_message

    def message
      super + " in message `#{@current_message}` at line #{@current_message.line}"
    end
  end

  def self.eval(code)
    message = Message.parse(code)
    message.call(Runtime)
  end

  def self.load(file)
    self.eval File.read(File.join(File.dirname(__FILE__), './capriccio/stdlib/' + file))
  end

  load 'boolean.cio'
  load 'if.cio'
end
