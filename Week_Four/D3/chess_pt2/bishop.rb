require_relative "piece.rb"
require_relative "stepable_module.rb"
class Bishop < Piece
  include Slideable

  def symbol
    "\u2657".colorize(@color)
  end
  
  def move_dirs
    x,y = @pos
    all_moves = [ [], [], [], [] ]

    (1..7).each do |i|
      all_moves[0] << [x-i,y-i]
      all_moves[1] << [x+i,y+i]
      all_moves[2] << [x-i,y+i]
      all_moves[3] << [x+i,y-i]
    end
    all_moves
  end
end
