
class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        p @secret_code.num_exact_matches(guess)
        p @secret_code.num_near_matches(guess)
    end

    def ask_user_for_guess
        p 'Enter a code'
        code = gets.chomp
        guess = Code.from_string(code)
        p @secret_code.num_exact_matches(guess)
        p @secret_code.num_near_matches(guess)
        @secret_code == guess
    end

end