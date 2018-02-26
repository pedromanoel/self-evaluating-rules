class SelfEvaluatingRule

  attr_reader :rootTerm

  def initialize(rootTerm:)
    @rootTerm = rootTerm
  end

  def evaluate
    rootTerm.resolve
  end

  alias_method :resolve, :evaluate
end