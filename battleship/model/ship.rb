require_relative './fire_result'

class Ship
  HORIZONTALLY = :horizontally
  VERTICALLY = :vertically

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
    FireResult.touch
  end
end
