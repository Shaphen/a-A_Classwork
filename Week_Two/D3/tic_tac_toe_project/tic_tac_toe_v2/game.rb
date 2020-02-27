require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize (board_size, player1_mark, player2_mark, *other_player_marks)
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @other_players = other_player_marks.map {|player_mark| HumanPlayer.new(player_mark)}
        @players_array = [@player1, @player2, @other_players].flatten
        @board = Board.new(board_size)
        @current_player = @player1
    end

    def switch_turn
        @current_player = @players_array.rotate!.first
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