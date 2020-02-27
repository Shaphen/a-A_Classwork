# def zip(*arrays)
#     count = 0
#     size = arrays[0].length
#     new_array = Array.new(size) { Array.new }
#     arrays.each do |array|
#         array.each_with_index do |ele, idx|
#             new_array[idx] << ele
#         end
#     end
#     new_array
# end

# def prizz_proc(arr, proc_1, proc_2)
#     new_array = []
#     arr.each do |ele|
#         result_1 = proc_1.call(ele)
#         result_2 = proc_2.call(ele)
#         new_array << ele if (result_1 && !result_2) || (result_2 && !result_1)
#     end
#     new_array
#     # arr.select {|ele| proc_1.call(ele) != proc_2.call(ele)}
# end

# def zany_zip (*arrays)
#     longest = arrays.inject {|acc, ele| (acc.length > ele.length) ? acc : ele }
#     size = longest.length
#     new_array = Array.new(size) {Array.new{nil}}
#     arrays.each do |array|
#         idx = 0
#         while idx < size
#             (array.length > idx) ? (new_array[idx] << array[idx]) : (new_array[idx] << nil)
#             idx += 1
#         end
#     end
#     new_array
# end

# def maximum (array, &prc)
#     return nil if array.empty?

#     array.inject { |acc, ele| (prc.call(acc) > prc.call(ele)) ? acc : ele }
    
# end

# def my_group_by(arr, &prc)
#     hash = Hash.new {|h,k| h[k] = []}
#     arr.each do |ele|
#         result = prc.call(ele)
#         hash[result] << ele
#     end
#     hash
# end

# def max_tie_breaker(arr, proc, &block)
#     return nil if arr.empty?
#     arr.inject do |acc, ele|
#         if block.call(acc) > block.call(ele)
#             acc 
#         elsif block.call(acc) < block.call(ele)
#             ele
#         else
#             (proc.call(acc) >= proc.call(ele)) ? acc : ele
#         end
#     end
# end

# def silly_syllables (sen)
#     vowels = 'aeiou'
#     words = sen.split(' ')
#     words.map! do |word|
#         first_vowel = 0
#         second_vowel = word.length - 1

#         while first_vowel < word.length && !vowels.include?(word[first_vowel])
#             first_vowel += 1
#         end
#         while second_vowel > 0 && !vowels.include?(word[second_vowel])
#             second_vowel -= 1
#         end

#         if first_vowel == second_vowel || second_vowel == 0
#             word
#         else
#             word[first_vowel..second_vowel]
#         end
#     end

#     words.join(' ')
# end

#_______________________________________________________________________________

#_______________________________________________________________________________