class Card
  attr_reader :suit, :value, :display_name

  def initialize(suit, value, display_name)
    @suit = :hearts
    @value = 11
    @display_name = 'A'
  end

  def display
    """-------------
         #{display_name}




       -------------"""
  end

end
