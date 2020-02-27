#add player marks
#print game board
#check for winners
#attribute must represent grid (@grid)
require_relative "./human_player.rb"

class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, '_')}
    end

    def valid? (pos) #pos is an array of 2 nums
        !(pos[0] > (@grid.length - 1) || pos[1] > (@grid.length - 1))
    end

    def empty? (pos)
        @grid[pos[0]][pos[1]] == "_"
    end
    
    def place_mark (pos, mark)
        if !valid?(pos) || !empty?(pos)
            raise 'place_mark error'
        else
            @grid[pos[0]][pos[1]] = mark
        end
    end

    def print
        @grid.each {|row| p row}
    end

    def win_row? (mark)
        @grid.any? do |row| 
            row.all? {|ele| ele == mark}
        end
    end

    def win_col? (mark)
        @grid.transpose.any? do |row| 
            row.all? {|ele| ele == mark}
        end
    end

    def win_diagonal? (mark)
        diag1 = (0...@grid.length).all? {|i| mark == @grid[i][i]} 
        diag2 = (0...@grid.length).all? {|i| mark == @grid[i][-(i+1)]}
        diag1 || diag2
    end

    def win? (mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_position?
        @grid.any? do |row|
            row.any? { |ele| ele == '_' }
        end
    end

    def legal_positions
       positions = []
        @grid.each_with_index do |row, i1|
            row.each_with_index do |ele, i2|
                positions << [i1, i2] if ele == "_"
            end
        end
        positions
    end
    
end
