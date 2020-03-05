# require_relative "./rook_bishop_queen.rb"
# require_relative "./pawn.rb"
# require_relative "./knight_king.rb"
# require_relative "./null_piece.rb"
class Piece
  attr_accessor :pos, :board, :color
  
  def initialize(pos=0, color=0, board=0)
    @color = color
    @board = board
    @pos = pos
    @symbol = "symbol"
    # @board.rows.each.with_index do |row,x|
    #   row.each.with_index do |ele,y|
    #     @pos == [x,y] if self == ele
    #   end
    # end
  end

end
