require 'rspec'
require 'rule/constant_term'

RSpec.describe 'ConstantTerm' do
  it 'resolves to its value' do
    term = ConstantTerm.new 10

    expect(term.resolve).to eq(10)
  end
end