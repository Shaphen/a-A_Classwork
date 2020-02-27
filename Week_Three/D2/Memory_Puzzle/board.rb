require_relative "./card.rb"
require "byebug"

class Board

    FACES = [:A, :A, :J, :J, :K, :K, :Q, :Q, :H, :H, :R, :R, :P, :P, :B, :B]
    
    def initialize
        @grid = Array.new(4) { Array.new(4, nil) }
    end

    def [](pos) # [1 2]
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val) # [1 2]
        row, col = pos
        @grid[row][col] = val
    end

    def empty?(pos)
        if self[pos]
            return false
        else
            return true
        end
    end
    
    def populate
        shuffled = FACES.shuffle
        # i = 0
        # while i < @grid.flatten.length
        #     @grid.flatten[i] = Card.new(shuffled[i])
        #     i += 1
        # end
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                @grid[i][j] = Card.new(shuffled.pop)
            end
        end
    end


    # def random_place(card)
    #     while @grid.flatten.count(card) < 1
    #         row = rand(0...@grid.length)
    #         col = rand(0...@grid.length)
    #         # pos = [row,col]
    #         if self.empty?([row,col])
    #             @grid[row][col] = card
    #         end
    #     end
    # end

    def render
        @grid.each do |row|
            row.each do |card|
                print " #{card.face} "
            end
            puts
        end
    end

    def all_face
        @grid.map do |row|
            row.map do |card|
                card.reveal
            end
        end 
    end

    def won?
        @grid.eql?(all_face)
    end

    def reveal_card(pos)
        self[pos].reveal
    end

    
    
end