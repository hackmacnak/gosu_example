class Player

  # initializes the Player object
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/spaceship.png", true)
   
    # this is setting the starting horizontal position of the icon
    @x = 326
    # this is setting the starting vertical position of the icon
    @y = 500
    @icon_height = 128
    @icon_width = 128
  end

  # draw the icon on the screen using the positing of @x and @y
  # @x is the horizontal position, @y is the vertical position, and the last value is the layer number
  def draw
    @icon.draw(@x, @y, 1)
  end

  # move icon to the left
  def move_left 
    # if @x is less than zero, reset it to zero to prevent it from moving off the screen
    if @x < 0
      @x = 0
    else
      @x = @x - 10
    end
  end

  def move_right
    # if @x is more than the total width of the screen, reset it to the value of the right edge.
    edge = @game_window.width - @icon_width
    if @x > edge
      @x = edge
    else
      @x = @x + 10
    end
  end
  
  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - 10
    end
  end
  
  def move_down
    edge = @game_window.height - @icon_height
    if @y > edge
      @y = edge
    else
      @y = @y + 10
    end
  end
  
  def hit_by?(balls)
     balls.any? {|ball| Gosu::distance(@x, @y, ball.x, ball.y) < 50}
  end
  
end