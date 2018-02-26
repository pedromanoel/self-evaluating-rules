require 'rspec'
require 'rspec/collection_matchers'
require 'rule'

RSpec.describe 'SelfEvaluatingRule' do

  context '#evaluate' do
    it 'calls resolve on the root term' do
      term = double('term')

      expect(term).to receive(:resolve).with(no_args)

      SelfEvaluatingRule.new(rootTerm: term).evaluate
    end

    it 'returns the value of the resolved terms' do
      const_term = ConstantTerm.new(10)
      root = UnaryTerm.new(const_term, :next)

      expect(SelfEvaluatingRule.new(rootTerm: root).evaluate).to eq(11)
    end
  end

  context '#resolve' do
    it 'returns the value of evaluate' do
      const_term = ConstantTerm.new('Pedro')
      root = UnaryTerm.new(const_term, :length)

      expect(SelfEvaluatingRule.new(rootTerm: root).resolve).to eq(5)

    end
  end

end