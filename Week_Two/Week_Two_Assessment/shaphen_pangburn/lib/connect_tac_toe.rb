require_relative 'board'
require_relative 'player'

class ConnectTacToe
    # This ConnectTacToe#play method is given for free and does not need to be modified
    # It is used to make your game playable.

    def initialize(num_stacks, max_height)
        @board = Board.new(num_stacks, max_height)
        @player_1 = Player.new('y')
        @player_2 = Player.new('b')
        @players = [@player_1, @player_2]
        @current_player = @player_1
    end

    def switch_players!
        @players.rotate!
        @current_player = @players[0]
    end

    def play_turn
        stack = @current_player.get_stack_index
        @board.add(@current_player.token, stack)
        switch_players!
    end

    def play
        until @board.winner?(@player_1.token) || @board.winner?(@player_2.token)
            @board.print
            self.play_turn
            p "--------------------"
        end

        self.switch_players!
        @board.print
        p @current_player.token + " has won!"
    end
end
