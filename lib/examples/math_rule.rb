require 'rule/self_evaluating_rule'
require 'rule/binary_term'
require 'rule/constant_term'
require 'rule/self_evaluating_rule'
require 'rule/variable_term'

class MathRule
  "4q + (p*r)"
  attr_reader :rule

  def initialize(q:, p:, r:)
    var_q = VariableTerm.new(source: q, message: :itself)
    mult_1 = BinaryTerm.new(ConstantTerm.new(4), :*, var_q)

    var_p = VariableTerm.new(source: p, message: :itself)
    var_r = VariableTerm.new(source: r, message: :itself)
    mult_2 = BinaryTerm.new(var_p, :*, var_r)

    root = BinaryTerm.new(mult_1, :+, mult_2)

    @rule = SelfEvaluatingRule.new(rootTerm: root)
  end

  def evaluate
    rule.evaluate
  end

end