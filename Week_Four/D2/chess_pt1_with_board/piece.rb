# require_relative "./rook_bishop_queen.rb"
# require_relative "./pawn.rb"
# require_relative "./knight_king.rb"
# require_relative "./null_piece.rb"
class Piece
  attr_accessor :pos, :board, :color
  
  def initialize(pos=0, color=0, board=0)
    @pos = pos
    @color = color
    @board = board
  end
  # private

end
