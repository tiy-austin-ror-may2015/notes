class Warrior
  attr_accessor :x, :y, :char, :health, :facing, :room
  def initialize(x, y, char = "\033[31m@\033[m", log: [], room: [])
    @x = x; @y = y; @char = char; @health = 10; @facing = EAST; @log = log;
    @room = room;
  end

  def walk!(direction)
    @facing = direction.upcase
    space = send(direction)
    if space != Room::EMPTY
      @log.push "#{color(0)}Warrior#{reset} blocked by #{space.name}"
    else
      case direction
      when NORTH then @y -= 1 if @y > 1
      when SOUTH then @y += 1 if @y < @room.height
      when EAST then  @x += 1 if @x < @room.width
      when WEST then  @x -= 1 if @x > 1
      end
      @log.push "#{color(0)}Warrior#{reset} walks #{direction}"
    end
  end

  private
  def north
    room[x, y - 1]
  end

  def east
    room[x + 1, y]
  end

  def south
    room[x, y + 1]
  end

  def west
    room[x - 1, y]
  end

  def color(code)
    case code
    when 0 then "\033[31m" #red
    when 1 then "\033[32m" #green
    when 3 then "\033[33m" #yellow
    when 4 then "\033[34m" #cyan
    when 5 then "\033[36m"
    else
      "\033[35m" #magenta
    end
  end

  def reset
    "\033[m"
  end
end

