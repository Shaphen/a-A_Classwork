require_relative "./board.rb"

class ComputerPlayer
    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_positions(legal_positions) #this is an array of legal positions
        legal_positions.sample
    end
    
end