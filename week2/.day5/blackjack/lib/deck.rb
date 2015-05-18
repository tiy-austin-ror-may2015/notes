class Deck
  attr_accessor :cards

  def initialize
    @card = Card.new(:hearts, 10, 'Q')
    # puts @card.inspect, @card.methods
    @card.print_value
  end


end
