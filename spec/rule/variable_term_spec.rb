require 'rspec'
require 'rule/variable_term'

RSpec.describe 'VariableTerm' do

  context '#instantiate' do
    it 'calls a message on the source' do
      source = double("source")
      expect(source).to receive(:message).with(no_args)

      VariableTerm
          .new(source: source, message: :message)
          .instantiate
    end

    it 'returns the value acquired from source' do
      integer = VariableTerm.new(source: '123', message: :to_i).instantiate

      expect(integer).to eq(123)
    end

    it 'can receive a variable source' do
      first_number = VariableTerm.new(source: [1, 2], message: :first)

      is_odd = VariableTerm.new(source: first_number, message: :odd?).instantiate

      expect(is_odd).to be true
    end

    it 'can receive a variable message' do
      parity = VariableTerm.new(source: [:odd?, :even?], message: :last)

      is_even = VariableTerm.new(source: 10, message: parity).instantiate

      expect(is_even).to be true
    end

  end

  context '#resolve' do
    it 'returns the value from source' do
      returned_value = VariableTerm.new(source: 123, message: :to_s).resolve

      expect(returned_value).to eq('123')
    end
  end

end
