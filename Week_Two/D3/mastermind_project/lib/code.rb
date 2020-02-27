
class Code
    attr_reader :pegs

    POSSIBLE_PEGS = {
        "R" => :red,
        "G" => :green,
        "B" => :blue,
        "Y" => :yellow
    }

    def self.random(length)
        pegs_arr = []

        while pegs_arr.length < length
            pegs_arr << POSSIBLE_PEGS.keys.sample
        end

        instance = Code.new(pegs_arr)
    end

    def self.from_string(pegs_str)
        guess = Code.new(pegs_str.chars)
    end

    def self.valid_pegs?(pegs_arr)
        pegs_arr.all? do |char|
            POSSIBLE_PEGS.has_key?(char.upcase)
        end
    end

    def initialize(pegs_arr)
        if Code.valid_pegs?(pegs_arr)
            @pegs = pegs_arr.map { |ele| ele.upcase }
        else
            raise 'WRONG PEGS'
        end
    end

    def [](idx)
        @pegs[idx]
    end

    def length
        @pegs.length
    end

    def num_exact_matches(guess)
        count = 0
        guess.pegs.each_with_index do |peg, idx|
            if @pegs[idx] == peg
                count += 1
            end
        end
        count
    end

    def num_near_matches(guess)
        count = 0
        guess.pegs.each_with_index do |peg, idx|
            if @pegs[idx] != peg && @pegs.include?(peg)
                count += 1
            end
        end
        count
    end

    def ==(guess)
        guess.pegs.each_with_index do |peg, idx|
            if @pegs[idx] != peg
                return false
            end
        end
        true
    end
    
end