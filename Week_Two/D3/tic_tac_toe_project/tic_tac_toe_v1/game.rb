require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize (player1_mark, player2_mark)
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end
    
    def play
        while @board.empty_position?
            @board.print
            pos = @current_player.get_position
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