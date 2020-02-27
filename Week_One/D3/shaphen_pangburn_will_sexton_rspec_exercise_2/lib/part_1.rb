def partition (arr, num)
    result = [ [], [] ]

    arr.each { |ele| (ele >= num) ? result[1].push(ele) : result[0].push(ele) }
    
    result
end

def merge (hash1, hash2)
    hash3 = {}

    hash1.each do |k, v|
        hash3[k] = v
    end
    hash2.each do |k, v|
        hash3[k] = v
    end
    
    hash3
end

def censor(sent, arr)
    vowels = "aeiouAEIOU"
    modified = sent.split(" ").map do |word|
        if arr.include?(word.downcase)
            vowels.each_char{|char| word = word.split(char).join("*")}
            word
        else
            word
        end
    end
    modified.join(" ")
end

def power_of_two? (num)
    return true if num == 1
    return false if num % 2 != 0
    return power_of_two? (num / 2)
end
