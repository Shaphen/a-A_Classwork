
require_relative "./null_piece.rb"
require_relative "./rook_bishop_queen.rb"
require_relative "./pawn.rb"
require_relative "./knight_king.rb"
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
            @rows[0][idx] = Rook.new([0,idx],:white,"board")
          elsif idx == 1 || idx == 6
            @rows[0][idx] = Knight.new([0,idx],:white,"board")
          elsif idx == 2 || idx == 5
            @rows[0][idx] = Bishop.new([0,idx],:white,"board")
          elsif idx == 3
            @rows[0][idx] = King.new([0,idx],:white,"board")
          elsif idx == 4
            @rows[0][idx] = Queen.new([0,idx],:white,"board")
          end
        end
      elsif row_idx == 1
        row.each.with_index {|el,idx| @rows[1][idx] = Pawn.new([1,idx],:white,"board")}
      elsif row_idx == 6
        row.each.with_index {|el,idx| @rows[6][idx] = Pawn.new([1,idx],:black,"board")}
      elsif row_idx == 7
        row.each_with_index do |ele, idx|
          if idx == 0 || idx == 7
            @rows[7][idx] = Rook.new([7,idx],:black,"board")
          elsif idx == 1 || idx == 6
            @rows[7][idx] = Knight.new([7,idx],:black,"board")
          elsif idx == 2 || idx == 5
            @rows[7][idx] = Bishop.new([7,idx],:black,"board")
          elsif idx == 3
            @rows[7][idx] = King.new([7,idx],:black,"board")
          elsif idx == 4
            @rows[7][idx] = Queen.new([7,idx],:black,"board")
          end
        end
      end
    end

  end

  def move_piece(start_pos,end_pos)
    x,y = start_pos
    x1, y1 = end_pos
    piece1 = @rows[x][y]
    piece2 = @rows[x1][y1]

    piece1.pos = end_pos
    piece2.pos = start_pos

    @rows[x][y], @rows[x1][y1] = @rows[x1][y1], @rows[x][y]
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