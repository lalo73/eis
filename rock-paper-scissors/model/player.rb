class Player
  attr_reader :choice
  def rock!
    @choice = :rock
  end

  def paper!
    @choice = :paper
  end

  def scissors!
    @choice = :scissors
  end

  def beats?(player)
    self.choice != player.choice && ((self.choice == :rock && player.choice == :scissors) || self.choice == :paper && player.choice == :rock)
  end
end

