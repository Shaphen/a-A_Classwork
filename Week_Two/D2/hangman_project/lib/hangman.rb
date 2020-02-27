require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word      ## use self. when it's a class method
    return DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |ele, i|
      if char == @secret_word[i]
        indices << i
      end
    end
    indices
  end

  def fill_indices(char, arr)
    arr.each do |idx|
      @guess_word[idx] = char
    end
  end
  
  def try_guess(char)

    indices = get_matching_indices(char)
    @remaining_incorrect_guesses -= 1 if indices.empty?
    fill_indices(char, indices)

    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      return true
    end

  end

  def ask_user_for_guess
    puts "Enter a char:"
    answer = gets.chomp
    try_guess(answer)
  end

  def win?
    if @guess_word.join('') == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end
  
  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
  
end