class FireResult

  def initialize(config={})
    @config = config
  end

  def water?
    @config[:water]
  end

  def touch?
    false
  end

  def sunk?
    false
  end

  class << self
    def water
      FireResult.new water: true
    end
  end

end
