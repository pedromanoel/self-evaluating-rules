require 'examples/math_rule'


command_line = Proc.new begin

                        end

q  = VariableTerm.new(source: command_line, message: :call)
p  = VariableTerm.new(source: command_line, message: :call)
r  = VariableTerm.new(source: command_line, message: :call)

p MathRule.new(q: q, p: p, r: r).evaluate