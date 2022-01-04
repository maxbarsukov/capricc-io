# frozen_string_literal: true

module CapriccIo
  class CObject
    attr_accessor :slots, :proto, :value

    def initialize(proto = nil, value = nil)
      @proto = proto
      @value = value
      @slots = {}
    end

    def [](name)
      return @slots[name] if @slots.key?(name)
      return @proto[name] if @proto

      raise CapriccIo::Error, "Missing slot: #{name.inspect}"
    end

    def []=(name, value)
      @slots[name] = value
    end

    def def(name, &block)
      @slots[name] = block
    end

    def call(*_args)
      self
    end

    def clone(ruby_value = nil)
      CObject.new(self, ruby_value)
    end
  end
end
