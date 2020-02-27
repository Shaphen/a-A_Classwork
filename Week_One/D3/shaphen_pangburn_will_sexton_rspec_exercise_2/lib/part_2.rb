def palindrome? (str)

    return true if str.length == 1

    str.each_char.with_index do |char, ind|
        return false if char != str[-1 * (ind + 1)]
    end
    true
end

def substrings (str)
    result = []

    (0...str.length).each do |i|     # the beginning index of each substring
        (i...str.length).each do |j| # the final index of each substring
            result.push(str[i..j])
        end
    end
    
    result
end

def palindrome_substrings(str)

    substrings(str).select {|sub_string| palindrome?(sub_string) && sub_string.length > 1}

end