# frozen_string_literal: true

module CapriccIo
  class Method < CObject
    def initialize(context, message)
      @definition_context = context
      @message = message
      super(Runtime['Method'])
    end

    def call(receiver, calling_context, *args)
      method_context              = @definition_context.clone
      method_context['self']      = receiver
      method_context['arguments'] = Runtime['List'].clone(args)

      method_context['eval_arg'] = proc do |_receiver, context, at|
        (args[at.call(context).value] || Runtime['nil']).call(calling_context)
      end
      @message.call(method_context)
    end
  end
end
