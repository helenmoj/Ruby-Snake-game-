class Fruit < Gosu::Window
  attr_accessor :x, :y
  def initialize
    @x = 15
    @y = 15
  end

  def update
  end


  def draw
    Gosu.draw_rect(
        @x * Game::TILE,
        @y * Game::TILE,
        Game::TILE - 1,
        Game::TILE - 1,
        Gosu::Color::RED
    )
  end

  def regenerate
    @x = (rand * Game::TILE).floor
    @Y = (rand * Game::TILE).floor
  end
end