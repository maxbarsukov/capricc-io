# frozen_string_literal: true

RSpec.describe CapriccIo::Parser do
  it 'doesnt parse comment' do
    expect(described_class.parse('# comment', 1)).to eq []
  end

  it 'doesnt parse whitespaces' do
    expect(described_class.parse('  ', 1)).to eq []
    expect(described_class.parse("\t", 1)).to eq []
    expect(described_class.parse("\n\n", 1)).to eq []
  end

  it 'parses a string' do
    expect(described_class.parse('"hi"', 1).to_s).to eq '[<Message @name="hi">]'
  end

  it 'parses a number' do
    expect(described_class.parse('1', 1).to_s).to eq '[<Message @name=1>]'
  end

  it 'parses an identifier' do
    expect(described_class.parse('hello', 1).to_s).to eq '[<Message @name=hello>]'
  end

  it 'parses arguments' do
    expect(described_class.parse('hello(1)', 1).to_s).to eq '[<Message @name=hello, @args=[<Message @name=1>]>]'
    expect(described_class.parse('hello(1, 2)',
                                 1).to_s).to eq '[<Message @name=hello, @args=[<Message @name=1>, <Message @name=2>]>]'
  end
end
