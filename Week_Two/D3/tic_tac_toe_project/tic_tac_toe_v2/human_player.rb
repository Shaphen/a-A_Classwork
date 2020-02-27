require_relative './board.rb'

class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        digits = "0 1 2 3 4 5 6 7 8 9"
        p "it is #{mark_value}'s turn"
        p "please enter a position with 2 numbers separated by a space"
        answer = gets.chomp
        if answer.split.length < 2 || !answer.chars.all? {|char| digits.include?(char) }
            raise "get_position error"
        else 
            return answer.split.map {|ele| ele.to_i - 1}
        end
    end

end