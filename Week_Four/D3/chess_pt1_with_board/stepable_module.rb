 module Stepable
   def moves
    move_set = move_diffs
    move_set.reject do |position|
      @board[position].color == @color || !@board[position].pos.valid_pos?
    end
  end
  def move_diffs
    raise 'no move diffs method defined'
  end
end