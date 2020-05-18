require 'gosu'

require_relative '../../Helen Rubymine project/snake_game2_ruby./snake.rb'
require_relative '../../Helen Rubymine project/snake_game2_ruby./fruit.rb'


class Game < Gosu::Window
  WIDTH, HEIGHT = 400, 400
  TILE = 10

  WIDTH_IN_TILE = WIDTH/TILE

  def initialize
    super WIDTH, HEIGHT, false, 1000/15
    @snake = Snake.new
    @fruit = Fruit.new
  end

  def update
    if @snake.x == @fruit.x && @snake.y == @fruit.y
      @snake.increase
      @fruit.regenerate
    end

    @fruit.update
    @snake.update
    @snake.pos[0..-2].each do |x, y|
      @snake.reset if x == @snake.x && y == @snake.y
    end
  end

  def draw
    @snake.draw
    @fruit.draw
  end


  def button_down(id)
    case id
    when Gosu::KbUp    then @snake.up
    when Gosu::KbDown  then @snake.down
    when Gosu::KbLeft  then @snake.left
    when Gosu::KbRight then @snake.right
    end
  end
end

Game.new.show