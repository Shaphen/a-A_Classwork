require_relative "stepable_module.rb"
require_relative "piece.rb"
class King < Piece
  include Stepable

  def symbol
    "\u2654".colorize(@color)
  end

  def move_diffs
    x,y = @pos
    all_moves = [[x+1,y],[x-1,y],[x,y-1],[x,y+1],
    [x-1,y-1],[x+1,y+1],[x-1,y+1],[x+1,y-1]]
  end

end
