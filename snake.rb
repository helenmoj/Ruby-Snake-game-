class Snake < Gosu::Window
  attr_accessor :x, :y
  attr_reader :pos

  MIN_TAIL = 3

def initialize
  @x = 10
  @y = 10

  @vel_x = 0
  @vel_y = 0

  @tail = MIN_TAIL
  @pos = []
end

def update
  @x += @vel_x
  @y += @vel_y

  @x = 0 if @x > Game::WIDTH_IN_TILE
  @x = Game::WIDTH_IN_TILE if @x < 0
  @y = 0 if @y > Game::WIDTH_IN_TILE
  @y = Game::WIDTH_IN_TILE if @y < 0

  @pos << [@x, @y]

  @pos.shift until @pos.size <= @tail
end


def draw
  @pos.each do |x,y|
  Gosu.draw_rect(
      x * Game::TILE,
      y * Game::TILE,
      Game::TILE - 1,
      Game::TILE - 1,
      Gosu::Color::GREEN
  )
    end
end

  def reset
    @tail = MIN_TAIL
  end

  def increase
    @tail += 1
  end

  def up;    @vel_x = 0;  @vel_y = -1;  end
  def down;  @vel_x = 0;  @vel_y = 1;   end
  def left;  @vel_x = -1; @vel_y = 0;   end
  def right; @vel_x = 1;  @vel_y = 0;   end
end
