require 'rspec'
require 'rule/constant_term'

RSpec.describe 'ConstantTerm' do
  context '#resolve' do
    it 'return its value' do
      term = ConstantTerm.new 10

      expect(term.resolve).to eq(10)
    end

  end
end