$:.push(Dir.getwd)

require 'rubygems'
require 'gosu'
require 'player'
require "ball"

class MyGame < Gosu::Window

  def initialize
    # this sets the width and the heith of the screen (640x480)
    super(780,640, false)
    @player = Player.new(self)
    @balls = 3.times.map {Ball.new(self)}
    @running = true
    @pause = false
    @font = Gosu::Font.new(self, "System", 24 )
  end
  
  def button_down(id)
    if id == Gosu::Button::KbP
      if @pause == false
        @pause = true
      else
        @pause = false 
      end
    end
  end

  def update
    if @pause == false
      if @running
        if button_down? Gosu::Button::KbLeft
          @player.move_left
        end
  
        if button_down? Gosu::Button::KbRight
          @player.move_right
        end
  
        if button_down? Gosu::Button::KbUp
          @player.move_up
        end
     
        if button_down? Gosu::Button::KbDown
          @player.move_down
        end
  

        @balls.each { |ball| ball.update}
  
        if @player.hit_by? @balls
          stop_game!
        end
    
      else # if @running
          # the game is currently stopped
        if button_down? Gosu::Button::KbEscape
          restart_game
        end 
      end # if @running
    end #  if @pause == false
  end

  def draw
    @balls.each { |ball| ball.draw}
    @player.draw
    @font.draw("The game is paused.", 100, 200, 10) if @pause == true
  end
  
  def stop_game!
    @running = false
    
  end
  
  def restart_game
    @running = true
    @balls.each {|ball| ball.reset!}
  end

end


window = MyGame.new
window.show
