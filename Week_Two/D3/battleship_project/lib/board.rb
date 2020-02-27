
class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        count = 0
        @grid.flatten.each do |ele|
            count += 1 if ele == :S
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship!'
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        amt = @size / 4

        while @grid.flatten.count(:S) < amt
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)

            if @grid[row][col] == :N
                @grid[row][col] = :S
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |sub|
            sub.map { |ele| ele == :S ? ele = :N : ele }
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
    
end