require_relative './plus'
require_relative './subtraction'
require_relative './average'

class OperatorFactory
  def plus
    Plus.new
  end

  def subtraction
    Subtraction.new
  end

  def average
    Average.new
  end
end
