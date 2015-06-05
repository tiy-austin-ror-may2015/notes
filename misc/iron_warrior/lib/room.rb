class Room
  EMPTY = :space
  attr_accessor :width, :height, :entities
  def initialize(width, height, entities)
    @width = width; @height = height; @entities = entities;
  end

  def [](x, y)
    space  = @entities.find { |entity| entity.x == x && entity.y == y }
    return space if space && space.class != Warrior
    EMPTY
  end

  def print_room(display_width)
    room   = Array.new(height + 2) { Array.new(width + 2) { SPACE }}
    offset = (display_width / 2) - (room.length)
    entities.each do |entity|
      room[entity.y][entity.x] = entity.char
    end
    room.first.fill('▁')
    room.first[ 0] = SPACE
    room.first[-1] = SPACE
    room[1..-2].each do |row|
      row[ 0] = '|'
      row[-1] = '|'
    end
    room.last.fill('▔')
    room.last[0 ] = SPACE
    room.last[-1] = SPACE
    room.each do |row|
      puts "#{' ' * offset}#{row.join}"
    end
  end
end


