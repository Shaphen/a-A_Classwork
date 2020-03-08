require 'byebug'
#Polynomial n^2
# def my_min(arr)
#   smallest = arr.first
#   # debugger
#   (0...arr.length-1).each do |i|
#     (i+1...arr.length).each do |j|
#         smallest = arr[j] if arr[j] < smallest
#     end
#   end
#   smallest
# end

# Linear O(n)
# def my_min(arr)
#   smallest = arr[0]
#   (1...arr.length-1).each do |i|
#     smallest = arr[i] if arr[i] < smallest
#   end
#   smallest
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#_______________________________________________________________________________

# def max_sub_sum(arr)
#   res = []
#   (0...arr.length).each do |i|
#     (i...arr.length).each do |j|
#       res << arr[i..j]
#     end
#   end

#   max_sum = 0
#   res.each do |arr|
#     max_sum = arr.sum if (arr.sum > max_sum)
#   end
#   max_sum
# end

# two variabls
# largest = arr.sum
# curr_sum

# def max_sub_sum(arr)
#   largest = arr.sum
#   i = 0
#   j = i
#   # debugger
#   while i < arr.length-1 && j < arr.length
#     curr_sum = arr[i..j].sum
#     if curr_sum > largest
#       largest = curr_sum
#     end
#     if j == arr.length-1 # 2
#       i += 1 
#       j = i
#       # break # stops loop
#       next # starts the loop over immediately
#     end
#     j += 1
#   end
#   largest
# end

def max_sub_sum(arr)
  largest = arr.shift
  arr.each_with_index do |el,i|
    curr_sum = largest + el
    if curr_sum >= largest
      largest += el
    else
      largest = el if el > largest
    end
  end
  largest
end
p max_sub_sum([2, 3, -6, 7, -6, 7]) # => 8
p max_sub_sum([-5, -1, -3]) # => -1