# frozen_string_literal: true

require_relative './object'
require_relative '../parser'

module CapriccIo
  class Message < CapriccIo::CObject
    attr_accessor :next, :name, :args, :line, :cached_value

    def initialize(name, line)
      @name = name
      @args = []
      @line = line
      @cached_value = case @name
                      when /^\d+/
                        Runtime['Number'].clone(@name.to_i)
                      when /^"(.*)"$/
                        Runtime['String'].clone(Regexp.last_match(1))
                      end

      @terminator = %W[. \n].include?(@name)
      super(Runtime['Message'])
    end

    def call(receiver, context = receiver, *_args)
      value = if @terminator
                context
              elsif @cached_value
                @cached_value
              else
                receiver[name].call(receiver, context, *@args)
              end

      return @next.call(value, context) if @next

      value
    rescue CapriccIo::Error => e
      e.current_message ||= self
      raise
    end

    def to_s(level = 0)
      s = '  ' * level
      s << "<Message @name=#{@name}"
      s << (", @args=#{@args.inspect}") unless @args.empty?
      s << (", @next=\n#{@next.to_s(level + 1)}") if @next
      "#{s}>"
    end
    alias inspect to_s

    def self.parse(code)
      Parser.parse(code, 1).last
    end
  end
end
