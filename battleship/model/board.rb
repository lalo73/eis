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

  #sorry future self :/
  def fire_at(x, y)
    y = y.to_i
    if taken? x, y
      if taken_horizontally? x, y
        index =  first_left(x, y)
        get(x, index).touch! y - index
      else
        index = first_above(x, y)
        get(index, y).touch! (x.ord - index.ord)
      end
    else
      FireResult.water
    end
  end

  def first_left(x, y)
    (0..y).to_a.reverse.find do |position|
      ship = get(x, position)
      (!ship.nil?) && ship.horizontally?
    end
  end

  def first_above(x, y)
    (first_position..x.ord).to_a.reverse.map(&:chr).find do |position|
      ship = get(position, y) 
      (!ship.nil?) && ship.vertically?
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
    y = y.to_i
    index = first_left(x, y)
    (get(x, index).lenght - 1 + index) >= y if index
  end

  def taken_vertically?(x, y)
    y = y.to_i
    index = first_above(x, y)
    (get(index, y).lenght - 1 + index.ord) >= x.ord if index
  end

  def get(x, y)
    (@board[x] || [])[y]
  end

  def first_position
    "A".ord
  end
end
