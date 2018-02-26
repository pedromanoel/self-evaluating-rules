require 'rspec'
require 'examples/math_rule'

RSpec.describe 'MathRule' do
  it '4q + (p*r)' do
    expect(MathRule.new(q: 3, p: 5, r: 7).evaluate).to eq(4 * 3 + (5 * 7))
  end
end