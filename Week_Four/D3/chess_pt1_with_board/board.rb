
require_relative "./null_piece.rb"
require_relative "./rook.rb"
require_relative "./queen.rb"
require_relative "./bishop.rb"
require_relative "./pawn.rb"
require_relative "./knight.rb"
require_relative "./king.rb"
class Board
  attr_reader :rows
  def initialize
    @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
    place_starting_pieces
  end

  def place_starting_pieces
    @rows.each.with_index do |row,row_idx|
      if row_idx == 0
        row.each_with_index do |ele, idx|
          if idx == 0 || idx == 7
            @rows[0][idx] = Rook.new([0,idx],:white,self)
          elsif idx == 1 || idx == 6
            @rows[0][idx] = Knight.new([0,idx],:white,self)
          elsif idx == 2 || idx == 5
            @rows[0][idx] = Bishop.new([0,idx],:white,self)
          elsif idx == 3
            @rows[0][idx] = King.new([0,idx],:white,self)
          elsif idx == 4
            @rows[0][idx] = Queen.new([0,idx],:white,self)
          end
        end
      elsif row_idx == 1
        row.each.with_index {|el,idx| @rows[1][idx] = Pawn.new([1,idx],:white,self)}
      elsif row_idx == 6
        row.each.with_index {|el,idx| @rows[6][idx] = Pawn.new([1,idx],:black,self)}
      elsif row_idx == 7
        row.each_with_index do |ele, idx|
          if idx == 0 || idx == 7
            @rows[7][idx] = Rook.new([7,idx],:black,self)
          elsif idx == 1 || idx == 6
            @rows[7][idx] = Knight.new([7,idx],:black,self)
          elsif idx == 2 || idx == 5
            @rows[7][idx] = Bishop.new([7,idx],:black,self)
          elsif idx == 3
            @rows[7][idx] = King.new([7,idx],:black,self)
          elsif idx == 4
            @rows[7][idx] = Queen.new([7,idx],:black,self)
          end
        end
      end
    end
  end

  def [](pos)
    x,y = pos
    @rows[x][y]
  end

  def []=(pos,val)
    x,y = pos
    @rows[x][y] = val
  end

  def valid_pos?(pos)
    x,y = pos
    x >= 0 && x <= 7 && y >= 0 && y <= 7
  end

  def move_piece(start_pos,end_pos)
    piece1 = self[start_pos]
    piece2 = self[end_pos]
    if !valid_pos?(start_pos) || !valid_pos?(end_pos)
      raise "you can't go there..."
    else
      piece1.pos = end_pos
      piece2.pos = start_pos
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
    self.show
  end
  
  def show
    @rows.each do|row| 
      row.each do |ele|
        if ele.color.to_s[0] == "w" || ele.color.to_s[0] == "b"
          print "[#{ele.color.to_s[0]}#{ele.class.to_s[0]}]"
        else
          print "[  ]"
        end
      end
      puts
    end
    return 'woooooo'
  end
end