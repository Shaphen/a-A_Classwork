require_relative "piece.rb"

class Pawn < Piece

  def symbol
    "\u2659".colorize(@color)
  end
  
  def moves
    all_moves = []
    all_moves += forward_steps
    all_moves.reject! do |position|
      @board[position].color == @color || @board[position].color != @color || 
      !@board[position].pos.valid_pos?
    end
    all_moves += side_attack
  end

  def forward_steps
    x,y = @pos
    pos_moves = []
    pos_moves << [x+1,y] if @color == :white
    pos_moves << [x-1,y] if @color == :black
    if at_start_row? && @color == :white
      pos_moves << [x+2,y]
    elsif at_start_row? && @color == :black
      pos_moves << [x-2,y]
    end
    pos_moves
  end

  def at_start_row?
    return @pos[0] == 1 if self.color == :white
    return @pos[0] == 6 if self.color == :black
  end

  def side_attack
    x,y = @pos
    side_moves = []
    a = x-1
    b = y+1
    c =(y-1)
    d = [a,b]
    e = [a,c]
    if @color == :white
      side_moves << [x+1, y+1] #if @board[x+1, y+1].color == :black
      # side_moves << [x+1, y-1] if @board[x+1, y-1].color == :black
    elsif @color == :black
      # side_moves << d if @board[d].color == :white
      side_moves << e #if @board[e].color == :white
    end
    side_moves.reject { |ele| @board.valid_pos?(@board[ele].pos) }
  end

end