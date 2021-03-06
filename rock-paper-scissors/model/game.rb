class Game
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @round_count = 0
    @stats = {
      player_1 => 0,
      player_2 => 0
    }
  end

  def play!
    @round_count += 1
    raise RoundLimitExceded.new if @round_count > 3
    @stats[player_1] += 1 if player_1.beats? player_2
    @stats[player_2] += 1 if player_2.beats? player_1
  end

  def winner
    return nil if @round_count < 2
    if @stats[player_1] > @stats[player_2]
      player_1
    elsif @stats[player_2] > @stats[player_1]
      player_2
    end
  end

end
