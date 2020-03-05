require_relative "piece.rb"
require_relative "slideable_module.rb"
class Rook < Piece
  include Slideable

  def symbol
    "\u2656".colorize(@color)
  end
  
  def move_dirs
    x,y = @pos
    all_moves = [ [], [], [], [] ]

    (1..7).each do |i|
      all_moves[0] << [x+i,y]
      all_moves[1] << [x-i,y]
      all_moves[2] << [x,y-i]
      all_moves[3] << [x,y+i]
    end
    all_moves
  end
end
