require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"
class Display
  def initialize(board)
    @cursor = Cursor.new([0,0],board)
    @board = board
  end

  def render
    @board.rows.each.with_index do|row,x| 
      row.each.with_index do |ele,y|
        if @cursor.cursor_pos == [x, y]
          print " #{ele.symbol} ".colorize( :background => :red)
        else
          print " #{ele.symbol} ".colorize( :background => :blue)
        end
      end
      puts
    end
  end

  def run
    i = 0
    until i == 1
      render
      @cursor.get_input
      system "clear"
    end
  end

end

b = Board.new
display = Display.new(b)
display.run
