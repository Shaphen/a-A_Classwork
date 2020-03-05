
module Slideable
  def moves
    possible_moves = move_dirs
    real_moves = []

    possible_moves.each do |angle|
      angle.each do |pos|
        break if @board[position].color == @color || !@board[position].pos.valid_pos?
        real_moves << pos
      end
    end
    
    real_moves
  end

  def move_dirs
    raise "no move dirs method defined"
  end
end