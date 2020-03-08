
# def first_anagram?(str1, str2)
#   arr1 = str1.chars.permutation.to_a

#   arr1.each do |arr|
#     return true if arr == str2.chars
#   end

#   false
# end

def second_anagram?(str1,str2)
  str1.chars.each_with_index do |char,i|
    if !str2.chars.find_index(char).nil?
       idx = str2.chars.find_index(char)
       str2 = str2[0...idx] + str2[idx+1..-1]
    end
  end
  return true if str2.length ==0
  false
end

def third_anagram?(str1,str2)
  str1.chars.sort.join == str2.chars.sort.join
end

def fourth_anagram?(str1,str2)
  res1 = Hash.new(0)
  res2 = Hash.new(0)
  str1.each_char do |char|
    res1[char] += 1
  end
  str2.each_char do |char|
    res2[char] += 1
  end

  res1 == res2
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true