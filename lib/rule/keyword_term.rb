class KeywordTerm

  attr_reader :receiver, :arguments, :operator

  def initialize(receiver, operator, *arguments)
    @receiver = receiver
    @operator = operator
    @arguments = arguments
  end

  def resolve
    resolved_args = arguments.map { | arg | arg.resolve }

    receiver.resolve.send(operator, *resolved_args)
  end
end