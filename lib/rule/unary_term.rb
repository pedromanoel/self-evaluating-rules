class UnaryTerm
  attr_reader :receiver, :operator

  def initialize(receiver, operator)
    @receiver = receiver
    @operator = operator
  end

  def resolve
    receiver.resolve.send(operator)
  end
end