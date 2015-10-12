class Ship
  HORIZONTALLY = :horizontally

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
end
