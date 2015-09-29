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

  def monkey!
    @choice = :monkey
  end

  def beats?(player)
    self.choice != player.choice && ((self.choice == :rock && player.choice == :scissors) || self.choice == :paper && player.choice == :rock || self.choice == :scissors && player.choice == :paper || self.choice == :scissors && player.choice == :monkey)
  end
end

