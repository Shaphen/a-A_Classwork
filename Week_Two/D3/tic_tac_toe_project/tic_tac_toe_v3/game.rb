require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

class Game

    def initialize (board_size, players_hash) #player1_mark, player2_mark, *other_player_marks)
        @players_array = []
        players_hash.each do |k, v| # keys are marks, values are true/false (comp/human)
            if v == true
                @players_array << ComputerPlayer.new(k)
            else
                @players_array << HumanPlayer.new(k)
            end
        end
        @board = Board.new(board_size)
        @current_player = @players_array[0]
    end

    def switch_turn
        @current_player = @players_array.rotate!.first
    end
    
    def play
        while @board.empty_position?
            @board.print
            pos = @current_player.get_positions(@board.legal_positions)
            @board.place_mark(pos, @current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                p "VICTORY!!!!"
            else
                self.switch_turn
            end
        end
        p 'Draw'
    end
    
end