class Board
  def initialize
    @board = {}
  end

  def empty?
    @board.empty?
  end

  def place_horizontally(ship, x, y)
    ship.horizontally!
    @board[x] ||= []
    @board[x].insert(y.to_i, ship)
  end

  def place_vertically(ship, x, y)
    @board[x] ||= []
    @board[x].insert(y.to_i, ship)
  end

  def taken?(x, y)
    y = y.to_i
    taken_horizontally? x, y
  end

  private

  def taken_horizontally?(x, y)
    row = @board[x]
    (0..y).to_a.reverse.any? do |position|
      ship = row[position]
      (!ship.nil?) && ship.horizontally? && (ship.lenght - 1 + position) >= y
    end
  end
end
