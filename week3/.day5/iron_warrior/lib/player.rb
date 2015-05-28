class Player
  def step(warrior)
    if rand < 0.5
      warrior.walk!(EAST)
    else
      warrior.walk!(NORTH)
    end
  end
end
