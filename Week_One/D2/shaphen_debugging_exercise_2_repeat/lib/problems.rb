# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor (num)
    
    (2..num).inject do |acc, n|
        if n > acc && num % n == 0 && is_prime?(n)
            n
        else
            acc
        end
    end

end

def is_prime? (num)
    if num < 2
        return false
    end

    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end

    true
end

def unique_chars? (str)

    str.each_char do |c|
        if str.count(c) > 1
            return false
        end
    end

    true
end

def dupe_indices (arr)
    my_hash = Hash.new{ |k, v| k[v] = [] }

    arr.each_with_index do |ele, ind|
        if arr.count(ele) > 1
            my_hash[ele].push(ind)
        end
    end

    my_hash
end

def ana_array (arr1, arr2)

    arr1.each do |ele|
        if !arr2.include?(ele)
            return false
        end
    end

    arr2.each do |ele|
        if !arr1.include?(ele)
            return false
        end
    end

    true
end