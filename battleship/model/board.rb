class Board
  def initialize
    @board = {}
  end

  def empty?
    @board.empty?
  end

  def place_horizontally(ship, x, y)
    @board[x] ||= []
    @board[x].insert(y.to_i, ship)
  end
end
