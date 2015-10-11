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

  def taken?(x, y)
    !@board[x][y.to_i].nil?
  end
end
