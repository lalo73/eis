class Board
  DEFAULT_WIDTH = 10
  DEFAULT_HEIGHT = 10
  attr_reader :width, :height
  def initialize(width=DEFAULT_WIDTH, height=DEFAULT_HEIGHT)
    @width = width
    @height = height
    @board = {}
  end

  def empty?
    @board.empty?
  end

  def place_horizontally(ship, x, y)
    ship.horizontally!
    place_at(ship, x, y)
  end

  def place_vertically(ship, x, y)
    ship.vertically!
    place_at(ship, x, y)
  end

  def taken?(x, y)
    y = y.to_i
    taken_horizontally?(x, y) || taken_vertically?(x, y)
  end

  def valid_position?(x, y)
    real_position = x.ord - first_position
    real_position <= width - 1 && y.to_i <= height
  end

  def fire_at(x, y)
    FireResult.new
  end

  private

  def place_at(ship, x, y)
    return false unless valid_position? x, y
    @board[x] ||= []
    if @board[x][y.to_i].nil?
      @board[x].insert(y.to_i, ship)
      true
    end
  end

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
