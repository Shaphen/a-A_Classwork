# def select_even_nums  (arr)

#     arr.select { |num| num % 2 == 0}

# end

# def reject_puppies (dogs)
#     dogs.reject do |dog|
#         dog["age"] <= 2
#     end
# end

# def count_positive_subarrays (arr)
#     arr.count do |subArr|
#         subArr.sum > 0
#     end
# end

# def aba_translate (str)
#     vowels = 'aeiou'
#     new_str = ""
#     str.each_char.with_index do |char, ind|
#         if vowels.include?(char)
#             new_str += char + "b" + char
#         else
#             new_str += char
#         end
#     end

#     new_str
# end

# def aba_array (arr)
    
#     new_arr = arr.map { |word| aba_translate(word) }

#     new_arr
# end

#_______________________________________________________________________________
 # DO IT AGAIN!!!
#_______________________________________________________________________________

def select_even_nums (arr)

    arr.select { |num| num.even? }

end

def reject_puppies (hash_arr)

    hash_arr.reject { |dog| dog["age"] <= 2 }

end

def count_positive_subarrays (multi_arr)

    multi_arr.count do |sub|
        sub.sum > 0
    end
    
end

def aba_translate (word)
    vowels = "aeiou"
    translated = ""

    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            translated += char + 'b' + char
        else
            translated += char
        end
    end
    
    translated
end

def aba_array (arr)

    arr.map { |word| aba_translate(word) }
    
end