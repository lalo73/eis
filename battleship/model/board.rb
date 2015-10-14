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
    if taken? x, y
      FireResult.touch 
    else
      FireResult.water
    end
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
    index = (0..y).to_a.reverse.find do |position|
      ship = row[position]
      (!ship.nil?) && ship.horizontally?
    end
    (row[index].lenght - 1 + index) >= y if index
  end

  def taken_vertically?(x, y)
    ord_x = x.ord
    index = (first_position..ord_x).to_a.reverse.map(&:chr).find do |position|
      ship = (@board[position] || [])[y]
      (!ship.nil?) && ship.vertically?
    end
    (@board[index][y].lenght - 1 + index.ord) >= ord_x if index
  end

  def first_position
    "A".ord
  end
end
