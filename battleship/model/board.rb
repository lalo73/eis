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
    if @board[x][y.to_i].nil?
      @board[x].insert(y.to_i, ship)
      true
    end
  end

  def place_vertically(ship, x, y)
    ship.vertically!
    @board[x] ||= []
    if @board[x][y.to_i].nil?
      @board[x].insert(y.to_i, ship)
      true
    end
  end

  def taken?(x, y)
    y = y.to_i
    taken_horizontally?(x, y) || taken_vertically?(x, y)
  end

  private

  def taken_horizontally?(x, y)
    row = @board[x] || []
    (0..y).to_a.reverse.any? do |position|
      ship = row[position]
      (!ship.nil?) && ship.horizontally? && (ship.lenght - 1 + position) >= y
    end
  end

  def taken_vertically?(x, y)
    ord_x = x.ord
    (first_position..ord_x).to_a.reverse.map(&:chr).any? do |position|
      ship = (@board[position] || [])[y]
      (!ship.nil?) && ship.vertically? && (ship.lenght - 1 + position.ord) >= ord_x
    end
  end

  def first_position
    "A".ord
  end
end
