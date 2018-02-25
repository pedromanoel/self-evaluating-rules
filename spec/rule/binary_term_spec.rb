require 'rspec'
require 'rule/binary_term'

RSpec.describe 'BinaryTerm' do

  context '#resolve' do

    it 'resolves the receiver and argument' do
      receiver = double('receiver', :resolve => 0)
      argument = double('argument', :resolve => 0)

      expect(receiver).to receive(:resolve).with(no_args)
      expect(argument).to receive(:resolve).with(no_args)

      BinaryTerm.new(receiver, :+, argument).resolve
    end

    it 'calls the operator on the resolved receiver with the resolved argument' do
      receiver = double('receiver', :resolve => 10)
      argument = double('argument', :resolve => 20)

      expect(BinaryTerm.new(receiver, :+, argument).resolve).to eq(30)
    end

  end

end