def hipsterfy (word)
    vowels = 'aeiou'

    reversed = word.reverse
    reversed.each_char do |c|
        if vowels.include?(c)
            reversed[c] = ""
            return reversed.reverse
        end
    end

    word
end

def vowel_counts (str)
    vowels = 'aeiou'
    my_hash = Hash.new(0)

    str.downcase.each_char do |c|
        if vowels.include?(c)
            my_hash[c] += 1
        end
    end

    my_hash
end

def caesar_cipher (mes, num)
    al = 'abcdefghijklmnopqrstuvwxyz'
    new_str = ""

    mes.each_char do |c|
        if al.include? (c)
            old_index = al.index(c)
            new_index = old_index + num
            final_letter = al[new_index % al.length]
            new_str += final_letter
        else
            new_str += c
        end
    end

    new_str
end