# frozen_string_literal: true

module CapriccIo
  object = CObject.new

  object.def 'clone' do |receiver, _context|
    receiver.clone
  end

  object.def 'set' do |receiver, context, name, value|
    receiver[name.call(context).value] = value.call(context)
  end

  object.def 'print' do |receiver, _context|
    puts receiver.value
    Runtime['nil']
  end

  Runtime = object.clone

  Runtime['Runtime'] = Runtime
  Runtime['Object']  = object
  Runtime['nil']     = object.clone(nil)
  Runtime['true']    = object.clone(true)
  Runtime['false']   = object.clone(false)
  Runtime['Number']  = object.clone(0)
  Runtime['String']  = object.clone('')
  Runtime['List']    = object.clone([])
  Runtime['Message'] = object.clone
  Runtime['Method']  = object.clone

  Runtime.def 'def' do |_receiver, context, message|
    Method.new(context, message)
  end
end
