require_relative "stepable_module.rb"
require_relative "piece.rb"
class King < Piece
  include Stepable
  def move_diffs
    x,y = @pos
    all_moves = [[x+1,y],[x-1,y],[x,y-1],[x,y+1],
    [x-1,y-1],[x+1,y+1],[x-1,y+1],[x+1,y-1]]
  end

end

# @pos = pos
#     @color = color
#     @board = board
[1,2]