class FireResult

  def initialize(config={})
    @config = config
  end

  def water?
    @config[:water]
  end

  def touch?
    @config[:touch]
  end

  def sunk?
    false
  end

  class << self
    def water
      FireResult.new water: true
    end
    
    def touch
      FireResult.new touch: true
    end
  end

end
