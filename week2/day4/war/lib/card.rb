class Card
  SUITS = [:heart, :spade, :diamond, :club]

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def display
    """
     ----
    | #{suit} |
    | #{display_value} |
     ----
    """
  end

  def display_value
    case value
    when 11 then "J"
    when 12 then "Q"
    when 13 then "K"
    when 14 then "A"
    else
      value
    end
  end
end
