# PHASE 2
# class IncorrectInputError < StandardError; end

def convert_to_int(str)
    # nums = "1234567890"
    # raise IncorrectInputError if str.chars.none? { |char| nums.include?(char) }
  Integer(str)  
  rescue ArgumentError
    puts "This ain't a string brah"
      return nil
  else
  Integer(str)  

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
  rescue StandardError
    if maybe_fruit == "coffee"
     puts "at least its coffee. but i still want fruit!!!!"
      retry
    else
    raise "this isn't fruit. maybe if you don't give me fruit at least give me some coffee"
    end
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length == 0
      raise ArgumentError, "you don't even know their name....really?" 
    end
    @name = name
    raise "you don't even know each other" if yrs_known < 5
    @yrs_known = yrs_known
    if fav_pastime.length == 0
      raise ArgumentError, "you don't even know their pastime?" 
    end
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


