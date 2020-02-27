# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
require 'byebug'

def compress_str (str)
    new_str = ""
    chars = str.split('')
    count = 1

    (0...chars.length).each do |idx|
        if str[idx] == str[idx + 1]
            count += 1
        else
            if count > 1
                new_str += count.to_s + str[idx]
                count = 1
            else
                new_str += str[idx]
            end
        end
    end
    
    new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
