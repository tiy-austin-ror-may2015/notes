class Player
  EAST  = :forward
  WEST  = :backward
  NORTH = :left
  SOUTH = :right
  def play_turn(warrior)
    north = warrior.feel(:left)
    south = warrior.feel(:right)
    east  = warrior.feel(:forward)
    west  = warrior.feel(:backward)
    spaces = [north, south, east, west]
    dirs   = [NORTH, SOUTH, EAST, WEST]

    enemies = spaces.map(&:enemy?)
    enemy_spaces   = warrior.listen.select(&:enemy?)

    captives = spaces.map(&:ticking?)
    captive_spaces = warrior.listen.select(&:ticking?)

    ##Rest if low and health and safe
    if enemies.none? && warrior.health < 10
      return warrior.rest!
    end

    ##Bind any enemies if outnumbered
    if spaces.select { |dir| dir.enemy? }.length > 1
      dirs.zip(spaces).each do |(dir, space)|
        return warrior.bind! dir if space.enemy?
      end
    end

    ##Rescue any nearby captives
    if captives.length > 0
      dirs.zip(spaces).each do |(dir, space)|
        return warrior.rescue! dir if space.ticking?
      end
    end

    #Walk towards captives if there are any
    if captive_spaces.length > 0
      cap_dir = warrior.direction_of(captive_spaces.first)
      ahead   = warrior.feel(cap_dir)
      if ahead.enemy?
        new_dirs = (dirs - [opposite(cap_dir), cap_dir]).reject { |x| warrior.feel(x).wall? }
        return warrior.walk!(new_dirs.sample)
      else
        return warrior.walk!(cap_dir)
      end
    else
      warrior.walk! warrior.direction_of_stairs
    end

    if east.enemy?
      warrior.attack!
    elsif warrior.feel(warrior.direction_of_stairs).enemy?
      warrior.attack! warrior.direction_of_stairs
    else
      warrior.walk! warrior.direction_of_stairs
    end
  end

  def opposite(dir)
    case dir
    when NORTH then SOUTH
    when SOUTH then NORTH
    when EAST then WEST
    when WEST then EAST
    end
  end
end
