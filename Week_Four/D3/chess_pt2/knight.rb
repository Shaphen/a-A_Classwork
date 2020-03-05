require_relative "piece.rb"
require_relative "stepable_module.rb"
class Knight < Piece
  include Stepable

  def symbol
    "\u2658".colorize(@color)
  end
  
  def move_diffs
    x,y = @pos
    possible_moves = [[x+1, y+2], [x-1, y+2], [x+1, y-2], [x-1, y-2],
    [x+2, y+1], [x-2, y+1], [x-2, y-1], [x+2, y-1]]
  end

end

# @pos = pos
#     @color = color
#     @board = board