class Deck

  def initialize
    @cards = Array.new
    [:hearts, :diamonds, :clubs, :spades].each do |suit|
      (2..10).each do |i|
        @cards.push(Card.new(suit, i))
      end
      @cards.push(Card.new(suit, 11)) #J
      @cards.push(Card.new(suit, 12)) #Q
      @cards.push(Card.new(suit, 13)) #K
      @cards.push(Card.new(suit, 14)) #A
    end
    @cards = @cards.shuffle
  end

  def draw
    @cards.pop
  end

  def count
    @cards.count
  end
end
