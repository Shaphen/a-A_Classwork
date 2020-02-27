# Define your methods here.
require 'byebug'

def my_map! (arr, &prc)

    arr.each_with_index { |ele, idx| arr[idx] = prc.call(ele) }
    
end

def two? (arr, &prc)
    count = 0

    arr.each { |ele| count += 1 if prc.call(ele) }
    
    count == 2
end

def nor_select (arr, prc1, prc2)
    new_arr = []

    arr.each { |ele| new_arr << ele if !prc1.call(ele) && !prc2.call(ele) }
    
    new_arr
end

def array_of_hash_sum (hash_arr)
    summed = 0

    hash_arr.each do |hash|
        hash.each { |k,v| summed += hash[k] }
    end
    
    summed
end

def slangify (sen)
    vowels = 'aeiou'
    words = sen.split(' ')
    new_word = []

    words.each_with_index do |word, arr_idx|
        word.each_char.with_index do |char, idx|
            if vowels.include?(char)
                removed = word[0...idx] + word[idx + 1..-1]
                new_word << removed
                break
            end
        end
        if !new_word[arr_idx]
            new_word << word
        end
    end
    
    new_word.join(' ')
end

def char_counter (str, *chars)
    counter = Hash.new(0)

    str.each_char do |str_char|
        if chars.include?(str_char)
            counter[str_char] += 1
        end
    end

    chars.each do |char|
        if !counter.has_key?(char)
            counter[char] = 0
        end
    end

    if chars.length == 0
        str.each_char { |char| counter[char] += 1 }
    end


    counter
end