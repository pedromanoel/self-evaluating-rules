# Self Evaluating Rules

This is an exercise in self evaluating rules, as explained in the article
[Self Evaluating Rules][self] by David M. West.

## Rules

I will try to implement the following rules presented in the article:

- A Dependent is eligible for Family Cover age if she or he is:
  under eighteen years of age;
  over eighteen but a Full-time Stude nt and receivi ng a majority of
  their support from the Insured, but n ot more than twenty-four years of age;
  or i f he or she is Dependent due to Disability or Illness.
- Your interest rate is the average prime rate (as published in the Wall Street 
  Journal) for the thirty days preceeding the issue date of your statement plus 4.5 
  percent.
- An Employee may have 0 or 1 Spouse
- `Py = (1/360 * FA) + (1/12 * (.0 75 * CB))`
- `X = 4q + (p*r)`

## The Model

A **SelfEvaluatingRule** is composed of **Terms**, and it is also a **Term** itself.

A **Term** has operations. It can be:

- Unary: associates an object with an operation
- Binary: extends Unary with an argument
- Keyword: extends binary with a collection of arguments
- Constant: has a fixed value
- Variables: a discrete value

(Obs: These names comes directly from how Smalltalk defines the different types of message sending.)

A **SelfEvaluatingRule** stores the **Terms** in a collection.
It can modify itself by adding and deleting terms.

Responds to:

    put_at(position, term)

    term_at(position)

    delete(position)

    add(term, position)

A **Term** evaluates itself:

    evaluate

    evaluteWithArguments

Because **Terms** are composable, they have to respond to a message that triggers its self-evaluation:

    resolve

Variables must obtain its value from a source. Therefore they must instantiate itself:

    instantiate

## Sample generic code

This is my attempt at translating Smalltalk to Ruby.

```ruby
class SelfEvaluatingRule

  def initialize(arguments, rootTerm)
    # ...
  end

  def evaluate
    @rootTerm.resolve
  end

  def evaluateWithArguments(arguments)
    @arguments = arguments

    evaluate
  end

  def resolve
    evaluate
  end

end

class UnaryTerm

  def initialize(receiver, operator)
    # ...
  end

  def resolve
    @receiver.send(@operator)
  end

end

class BinaryTerm

  def initialize(receiver, operator, argument)
    # ...
  end

  def resolve
    @receiver.resolve.send(@operator, @argument.resolve)
  end

end

class KeywordTerm

  def initialize(receiver, operator, arguments)
    # ...
  end

  def resolve

    resolved_arguments @arguments.map do | argument |
      argument.resolve
    end

    @receiver.resolve.send(@operator, resolved_arguments)

    self
  end

end

class Variable

  def initialize(source, getterMessage)
    # ...
  end

  def resolve
    instantiate
  end

  def instantiate
    @source.instantiate.send(@getterMessage.instantiate)
  end

end

class Constant

  def initalize(value)
    # ...
  end

  def resolve
    @value
  end

end

```

[self]: http://www.transcendencecorporation.com/files/pdf/RULES.pdf