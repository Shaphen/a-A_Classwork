require "byebug"
class Array

  def my_uniq
    res = self.sort
    i = 0
    while i < res.length 
      if res[i] == res[i+1]
        res.delete_at(i)
      else
        i += 1
      end
    end
    res
  end

  def to_sum
    res = []
    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2|
        if idx2 > idx1 && ele1 + ele2 == 0
          res << [idx1, idx2]
        end
      end
    end
    res
  end

  def my_transpose
    (0...length).map do |row|
      (0...length).map do |col|
        self[col][row]
      end
    end
  end

  def stock_picker # [10, 2, 5, 2, 7, 1, 4]

    # max = self.max
    # day_max = self.index(max)
    # min = self[0...day_max].min
    # day_min = self.index(min)
    # return [day_min, day_max]
    
    lowest = 0
    highest = 0 
    arr = []

    # debugger
    (0...length-1).each do |i|
      lowest = i # 10
      highest = i+1
      j = highest # 2
      # (i+2...length).each do |j|
      while j < self.length
        highest = j if self[j] > self[highest]
        j += 1
      end
      diff = self[highest] - self[lowest]
      arr << [diff,lowest,highest]
      # highest = 
    end
    res = arr.max_by { |x| x[0] }
    res[1..-1]
  end

end

class TowersOfHanoi
  attr_reader :size, :a, :b, :c
  def initialize(size = 3)
    @size = size
    @a = (1..size).to_a.reverse
    @b = []
    @c = []
  end


end