require_relative "piece.rb"
require_relative "stepable_module.rb"
class Queen < Piece
  include Slideable

  def symbol
    "\u2655".colorize(@color)
  end
  
  def move_dirs
    x,y = @pos
    all_moves = [ [], [], [], [], [], [], [], [] ]
    (1..7).each do |i|
      all_moves[0] << [x+i,y]
      all_moves[1] << [x-i,y]
      all_moves[2] << [x,y-i]
      all_moves[3] << [x,y+i]
      all_moves[4] << [x-i,y-i]
      all_moves[5] << [x+i,y+i]
      all_moves[6] << [x-i,y+i]
      all_moves[7] << [x+i,y-i]
    end
    all_moves
  end
end