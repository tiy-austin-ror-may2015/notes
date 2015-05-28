class Room
  EMPTY = :space
  attr_accessor :width, :height, :entities
  def initialize(width, height, entities)
    @width = width; @height = height; @entities = entities;
  end

  def [](x, y)
    space  = @entities.find { |entity| entity.x = x && entity.y = y }
    return space if space && space.class != Warrior
    EMPTY
  end
end


