class BinaryTerm
  attr_reader :receiver, :argument, :operator

  def initialize(receiver, operator, argument)
    @receiver = receiver
    @argument = argument
    @operator = operator
  end

  def resolve
    receiver.resolve.send(operator, argument.resolve)
  end
end