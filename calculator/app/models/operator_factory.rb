require_relative './plus'
require_relative './subtraction'

class OperatorFactory
  def plus
    Plus.new
  end

  def subtraction
    Subtraction.new
  end
end
