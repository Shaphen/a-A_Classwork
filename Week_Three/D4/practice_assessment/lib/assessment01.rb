class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift

    debugger
    self.each do |ele|
      accumulator = prc.call(accumulator, ele)
    end
    accumulator
  end
    
end

# [1, 2, 3, 4].inject(10) do |acc, el| 
#   acc + el 
# end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    return false if num % factor == 0
  end
  
  true
end

def primes(num)
  return [] if num == 0
  primes = []
  counter = 2

  until primes.length == 5
    primes << counter if is_prime?(counter)
    counter += 1
  end

  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num <= 1
  return [1, 1] if num == 2

  prev_fact = factorials_rec(num-1)
  next_fact = (num-1) * prev_fact[-1]

  prev_fact << next_fact
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    new_hash = Hash.new { |h,k| h[k] = [] }

    self.each_with_index do |ele, idx|
      if self.count(ele) > 1
        new_hash[ele] << idx
      end
    end
    
    new_hash
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sub_strings = []

    (0...self.length-1).each do |i|
      (i...self.length-1).each do |j|
        sub_strings << self[i..j]
      end
    end
    
    sub_strings.select do |subs|
      subs == subs.reverse && subs.length > 1
    end

  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
