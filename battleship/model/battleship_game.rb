require_relative './ship'
require_relative './board'

class BattleshipGame

  def initialize(x=Board::DEFAULT_WIDTH, y=Board::DEFAULT_HEIGHT)
    @board = Board.new(x, y)
  end

  def place_ship_horizontally(x, y)
    ship = build_destructor
    self.place_horizontally(ship, x, y)
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
