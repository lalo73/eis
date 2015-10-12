require_relative './ship'
require_relative './board'

class BattleshipGame

  def initialize
    @board = Board.new
  end
  def build_destructor
    Ship.new
  end

  def place_horizontally(ship, x, y)
    @board.place_horizontally(ship, x, y)
  end

  def empty?
    @board.empty?
  end

  def taken?(x, y)
    @board.taken? x, y
  end
end
