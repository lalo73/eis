require_relative './fire_result'

class Ship
  HORIZONTALLY = :horizontally
  VERTICALLY = :vertically

  def initialize(lenght = nil)
    @lenght = (lenght || default_lenght)
    @state = Array.new @lenght, true
  end

  def default_lenght
    3
  end

  def lenght
    default_lenght
  end

  def horizontally!
    @position = HORIZONTALLY
  end

  def horizontally?
    @position == HORIZONTALLY
  end

  def vertically!
    @position = VERTICALLY
  end

  def vertically?
    @position == VERTICALLY
  end

  def touch!(index)
    @state[index] = false
    if @state.any?
      FireResult.touch
    else
      FireResult.sunk
    end
  end
end
