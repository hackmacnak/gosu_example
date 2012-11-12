class Ball
  
  #initalize a new ball. the x coordinate will be a random number from 0 to the size of the game_window width
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/fireball.png")
   reset!
  end
  
  # when update us called, most the ball down 1 position
  def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + 10
    end
  end
  
  def draw
    @icon.draw(@x,@y,2)
  end
  
  def x
    @x
  end
  
  def y
    @y
  end
  
  def reset!
    @y = 0
    @x = rand(@game_window.width)
  end
end
    