class Board
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    attr_reader :max_height

    def self.build_stacks(sub_count)
        Array.new(sub_count) {Array.new(0)}
    end

    def initialize(stacks, max_height)
        @max_height = max_height
        if stacks >= 4 && max_height >= 4
            @stacks = Board.build_stacks(stacks)
        else
            raise 'rows and cols must be >= 4'
        end
    end

    def add(token, stack_idx)
        if @stacks[stack_idx].length < @max_height
            @stacks[stack_idx] << token
            true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
            all_same = stack.all? { |ele| ele == token }
            if all_same && stack.length >= max_height
                return true
            end
        end
        false
    end

    def horizontal_winner?(token)
        count = 0
        @stacks.each do |stack|
            if stack[0] == token
                count += 1
            end
        end

        if count >= @max_height
            return true
        else
            return false
        end
    end

    def winner?(token)
        if vertical_winner?(token)
            true
        else
            false
        end
    end
    
    def print
        @stacks.each { |stack| p stack }
    end
end
