class Player
  attr_reader :choice

  WIN_TABLE = {
    rock: {scissors: true},
    paper: {rock:true},
    scissors: {paper: true, monkey: true},
    monkey: {paper: true}
  }
  def rock!
    @choice = :rock
  end

  def paper!
    @choice = :paper
  end

  def scissors!
    @choice = :scissors
  end

  def monkey!
    @choice = :monkey
  end

  def beats?(player)
    WIN_TABLE[self.choice][player.choice]
  end
end

