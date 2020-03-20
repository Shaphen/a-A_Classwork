
# Problem 1:
# Given a pattern and a string str, determine if str follows the same pattern.

def same_pattern?(pattern)
    pattern = pattern[0].chars
    str = pattern[1].split(" ")
    pattern_code = []
    str_code = []
    i = 0

    while i < pattern.length
        char = pattern.first
        if pattern[i] == char
            pattern_code << 0
            i += 1
        else
            pattern_code << 1
            pattern.shift
        end
    end
    p pattern_code
end

# Example 1
pattern = "abba", str = "dog cat cat dog"
p same_pattern?(pattern)
# Output: true
# Example 2
pattern = "abba", str = "dog cat cat fish"
p same_pattern?(pattern)
# Output: false
# Example 3
pattern = "aaaa", str = "dog cat cat dog"
p same_pattern?(pattern)
# Output: false
# Example 4
pattern = "abba", str = "dog dog dog dog"
p same_pattern?(pattern)
# Output: false
# You may assume pattern contains only lowercase letters, and str contains 
# lowercase letters that may be separated by a single space. Can you solve it 
# in O(N) time and O(1) space?

#_______________________________________________________________________________

# Problem 2:
# Given two strings S and T, return if they are equal when both are typed into 
# empty text editors. In this case, # indicates a backspace character.

# Explanation: S becomes "c" while T becomes "b".
# Note:
# 1. 1 <= S.length <= 200
# 2. 1 <= T.length <= 200
# 3. S and T only contain lowercase letters and '#' characters.
# Can you solve it in O(N) time and O(1) space?



# Example 1
p S = "ab#c", T = "ad#c"
# Output: true
# Explanation: Both S and T become "ac".
# Example 2
p S = "ab##", T = "c#d#"
# Output: true
# Explanation: Both S and T become "".
# Example 3
p S = "a##c", T = "#a#c"
# Output: true
# Explanation: Both S and T become "c".
# Example 4
p S = "a#c", T = "b"
# Output: false

#_______________________________________________________________________________