def average (num1, num2)
    (num1 + num2) / 2.0
end

def average_array (arr)
    added = arr.inject(0.0) { |acc, num| acc + num }
    added / arr.length
end

def repeat (str, num)
    new_str = ""

    num.times { new_str += str }
    
    new_str
end

def yell (str)
    str.upcase + "!"
end

def alternating_case (sen)
    
    modified = sen.split(' ').each_with_index do |word, ind|
        if ind % 2 == 0
            word.upcase!
        else
            word.downcase!
        end
    end

    modified.join(' ')
end