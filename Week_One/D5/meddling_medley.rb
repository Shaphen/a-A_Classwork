#####Phase 1

#duos
# Write a method duos that accepts a string as an argument and returns 
# the count of the number of times the same character appears consecutively 
# in the given string.

def duos(str)
    count = 0
    str.each_char.with_index do |char, idx|
        count += 1 if str[idx] == str[idx + 1]
    end
    count
end

# Examples
# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

#_____________________________________________________________________________


# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as 
# arguments. The method should return a new sentence where every word is 
# replaced with it's corresponding value in the hash. If a word does not 
# exist as a key of the hash, then it should remain unchanged.

def sentence_swap(sen, hash)
    new_sen = []
    
    sen.split(" ").each do |word|
        (hash[word]) ? new_sen.push(hash[word]) : new_sen.push(word)
        # if hash[word] #hash.has_key?(word)
        #     new_sen << hash[word]
        # else
        #     new_sen << word
        # end
    end

    new_sen.join(" ")
end


# Examples
# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'
#________________________________________________________________________

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block. 
# The method should return a new hash where each key is the result of the 
# original key when given to the block. Each value of the new hash should 
# be the result of the original values when passed into the proc.

def hash_mapped (hash, proc, &prc)
    new_hash = {}

    hash.each { |k,v| new_hash[prc.call(k)] = proc.call(v) }
    
    new_hash
end

# Examples
# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

#________________________________________________________________________

# counted_characters
# Write a method counted_characters that accepts a string as an argument. 
# The method should return an array containing the characters of the string that 
# appeared more than twice. The characters in the output array should appear in 
# the same order they occur in the input string.

def counted_characters (str)
    count = Hash.new(0)

    str.each_char { |letter| count[letter] += 1 }
    
    count.keys.select { |k| count[k] > 2 }

end

# Examples
# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

#________________________________________________________________________


# triplet_true?
# Write a method triplet_true? that accepts a string as an argument and 
# returns a boolean indicating whether or not the string contains three 
# of the same character consecutively.

def triplet_true(str)
    str.each_char.with_index do |char,idx|
        return true if str[idx] == str[idx+1] && str[idx] == str[idx+2]
    end
    false
end

# Examples
# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false
#________________________________________________________________________



# energetic_encoding
# Write a method energetic_encoding that accepts a string and a hash as 
# arguments. The method should return a new string where characters of the 
# original string are replaced with the corresponding values in the hash. 
# If a character is not a key of the hash, then it should be replaced with 
# a question mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(str, hash)
    new_array = []
    str.split(" ").each do |word|
        new_word = ""
        word.each_char do |char|
            new_word += hash[char] ? hash[char] : "?"
        end
        new_array << new_word
    end
    new_array.join(" ")
end

# Examples
# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

#________________________________________________________________________


# uncompress
# Write a method uncompress that accepts a string as an argument. The 
# string will be formatted so every letter is followed by a number. The 
# method should return an "uncompressed" version of the string where every 
# letter is repeated multiple times given based on the number that appears 
# directly after the letter.

def uncompress(str)
    new_string = ""
    str.each_char.with_index do |char, idx|
        str[idx+1].to_i.times {new_string += char} if idx.even?
    end
    new_string
end

# Examples
# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'
#________________________________________________________________________



#####Phase 2


# conjunct_select
# Write a method conjunct_select that accepts an array and one or more procs 
# as arguments. The method should return a new array containing the elements 
# that return true when passed into all of the given procs.

def conjunct_select (arr, *prcs)

    arr.select { |ele| prcs.all?{ |prc| prc.call(ele) } }
    
end

# Examples
# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) 
# # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) 
# # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) 
# # [7]

#________________________________________________________________________

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. 
# The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word 
# (example: 'eat'->'eatyay')if the word begins with a non-vowel, move all letters 
# that come before the word's first vowel to the end of the word and add 'ay' 
# (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should 
# remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def convert_pig_latin (sen)
    vowels = 'aeiouAEIOU'
    words = sen.split(' ')

    words.map! do |word|
        if word.length < 3
            word
        else
            if vowels.include?(word[0])
                word + 'yay'
            else
                i = 0
                while !vowels.include?(word[i])
                    i += 1
                end
                new_word = word[i..-1] + word[0...i] + 'ay'
                (word == word.capitalize) ? (new_word.capitalize) : new_word
            end
        end
    end
    words.join(' ')
end

# Examples
# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

#________________________________________________________________________



# reverberate
# Write a method reverberate that accepts a sentence as an argument. 
# The method should translate the sentence according to the following 
# rules:

#     words that are shorter than 3 characters are unchanged
#     words that are 3 characters or longer are translated according to 
#     the following rules:
#         if the word ends with a vowel, simply repeat the word twice 
#             (example: 'like'->'likelike')
#         if the word ends with a non-vowel, repeat all letters that come 
#             after the word's last vowel, including the last vowel itself 
#             (example: 'trash'->'trashash')

# Note that if words are capitalized in the original sentence, they should 
# remain capitalized in the translated sentence. Vowels are the letters a, 
# e, i, o, u.

def reverberate(sen)
    vowels = "aeiou"
    words = sen.split(" ")
    words.map! do |word|
        if word.length < 3
            word 
        else
            if vowels.include?(word[-1])
                word + word.downcase
            else
                start_idx = word.length - 1
                while start_idx > 0 && !vowels.include?(word[start_idx])
                    start_idx -= 1
                end
                word + word[start_idx..-1]
            end
        end
    end
    words.join(" ")
end

# Examples
# p reverberate('We like to go running fast') 
# # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') 
# # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') 
# # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') 
# # "Herer familyily flewew to Francefrance"
#________________________________________________________________________

# disjunct_select
# Write a method disjunct_select that accepts an array and one or more procs 
# as arguments. The method should return a new array containing the elements 
# that return true when passed into at least one of the given procs.

def disjunct_select(arr, *procs)
    arr.select {|ele| procs.any?{|proc| proc.call(ele)}}
end

# Examples
# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

#________________________________________________________________________


# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument. 
# The method should return a new sentence where the words alternate between 
# having their first or last vowel removed. For example:
#     the 1st word should be missing its first vowel
#     the 2nd word should be missing its last vowel
#     the 3rd word should be missing its first vowel
#     the 4th word should be missing its last vowel
#     ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels 
# are the letters a, e, i, o, u.

def alternating_vowel(sen)
    vowels = "aeiou"
    words = sen.split(" ")
    new_array = []
    words.each_with_index do |word, idx|
        #decide odd or even index
        if idx.even?
            #find first vowel 
            word.each_char.with_index do |char, i|
                if vowels.include?(char)
                    new_array << word[0...i] + word[i+1..-1]
                    break
                end
            end
        else
            #find last vowel
            i = word.length - 1
            while i > 0 && !vowels.include?(word[i])
                i -= 1
            end
            new_array << word[0...i] + word[i+1..-1]
        end
        new_array << word if !new_array[idx]
    end
    new_array.join(" ")
end

# Examples
# p alternating_vowel('panthers are great animals') 
# # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') 
# # "rnning panthrs re epc"
# p alternating_vowel('code properly please') 
# # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') 
# # "my forecst prdicts ran tday"

#________________________________________________________________________

# silly_talk
# Write a method silly_talk that accepts a sentence as an argument. 
# The method should translate each word of the sentence according to 
# the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the 
# word (example: 'code'->'codee') if the word ends with a non-vowel, 
# every vowel of the word should be followed by 'b' and that same vowel 
# (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should 
# remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def silly_talk(sen)
    words = sen.split(" ")
    vowels = 'aeiouAEIOU'

    words.map! do |word|
        if vowels.include?(word[-1])
            word + word[-1]
        else
            new_word = ""

            word.each_char do |char|
                new_word += (vowels.include?(char)) ? (char + 'b' + char.downcase) : char
            end
            new_word
        end
    end
    words.join(" ")
end

# Examples
# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

#________________________________________________________________________

# compress
# Write a method compress that accepts a string as an argument. The method 
# should return a "compressed" version of the string where streaks of consecutive 
# letters are translated to a single appearance of the letter followed by the 
# number of times it appears in the streak. If a letter does not form a streak 
# (meaning that it appears alone), then do not add a number after it.

def compress (str)
    new_str = ""
    count = 1
    i = 0

    while i < str.length
        if str[i] == str[i + 1]
            count += 1
        else
            new_str += str[i]
            new_str += count.to_s if count > 1
            count = 1
        end
        i += 1
    end
    
    new_str
end

# Examples
# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"
#________________________________________________________________________
