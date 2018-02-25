class VariableTerm

  def initialize(source: , message: )
    @source = source
    @message = message
  end

  def instantiate
    source.send(message)
  end

  def resolve
    instantiate
  end

  private

  def source
    if @source.respond_to?(:instantiate)
      @source.instantiate
    else
      @source
    end
  end

  def message
    if @message.respond_to?(:instantiate)
      @message.instantiate
    else
      @message
    end
  end
end