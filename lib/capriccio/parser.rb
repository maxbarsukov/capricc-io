# frozen_string_literal: true

require_relative './runtime/message'

module CapriccIo
  class Parser
    def self.parse(code, line)
      code = code.strip
      i = 0
      message = nil
      messages = []

      while i < code.size
        case code[i..-1]
        when /\A("[^"]*")/, # string
          /\A(\d+)/,        # number
          /\A(\.)+/,        # dot
          /\A(\n)+/,        # line break
          /\A(\w+)/         # name
          m = Message.new(Regexp.last_match(1), line)
          if messages.empty?
            messages << m
          else
            message.next = m
          end
          line += Regexp.last_match(1).count("\n")
          message = m
          i += Regexp.last_match(1).size - 1

        when /\A(\(\s*)/    # arguments
          start = i + Regexp.last_match(1).size
          level = 1
          while level.positive? && i < code.size
            i += 1
            level += 1 if code[i] == '('
            level -= 1 if code[i] == ')'
          end
          line += Regexp.last_match(1).count("\n")
          code_chunk = code[start..i - 1]
          message.args = parse(code_chunk, line)
          line += code_chunk.count("\n")

        when /\A,(\s*)/
          line += Regexp.last_match(1).count("\n")
          messages.concat parse(code[i + 1..-1], line)
          break

        when /\A(\s+)/, # ignore whitespace
          /\A(#.*$)/    # ignore comments
          line += Regexp.last_match(1).count("\n")
          i += Regexp.last_match(1).size - 1

        else
          raise "Unknown char #{code[i].inspect} at line #{line}"
        end
        i += 1
      end
      messages
    end
  end
end
