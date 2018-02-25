require 'rspec'
require 'rule/unary_term'

RSpec.describe 'UnaryTerm' do

  context '#resolve' do
    it 'Calls resolve on the receiver' do
      receiver = double('receiver')
      term = UnaryTerm.new(receiver, :nil?)

      expect(receiver).to receive(:resolve).with(no_args)

      term.resolve
    end

    it 'calls the operation on the resolved receiver' do
      receiver = double('receiver', :resolve => 123)

      term = UnaryTerm.new(receiver, :next)

      expect(term.resolve).to eq(124)
    end
  end
end