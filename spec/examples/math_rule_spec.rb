require 'rspec'
require 'examples/math_rule'

RSpec.describe 'MathRule' do
  it '4q + (p*r)' do

    q  = VariableTerm.new(source: 3, message: :itself)
    p  = VariableTerm.new(source: 5, message: :itself)
    r  = VariableTerm.new(source: 7, message: :itself)

    expect(MathRule.new(q: q, p: p, r: r).evaluate).to eq(4 * 3 + (5 * 7))
  end
end