require_relative './plus'

class OperatorFactory
  def plus
    Plus.new
  end
end
