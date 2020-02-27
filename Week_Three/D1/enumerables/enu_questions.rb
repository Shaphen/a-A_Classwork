#_______________________________________________________________________________
# Enumerable
#_______________________________________________________________________________

# My Each

# Extend the Array class to include a method named my_each that takes a block, 
# calls the block on every element of the array, and returns the original array.
# Do not use Enumerable's each method. I want to be able to write:

# calls my_each twice on the array, printing all the numbers twice.

# return_value = [1, 2, 3].my_each {|num| puts num}.my_each { |num| puts num }
return_value = [1, 2, 3].my_each do |num|
    puts num
end.my_each do |num|
    puts num
end
p return_value  # => [1, 2, 3]
#_______________________________________________________________________________

# My Select
# Now extend the Array class to include my_select that takes a block and returns 
# a new array containing only elements that satisfy the block. Use your 
# my_each method!

# Example:

a = [1, 2, 3]
a.my_select { |num| num > 1 } # => [2, 3]
a.my_select { |num| num == 4 } # => []
#_______________________________________________________________________________

# My Reject
# Write my_reject to take a block and return a new array excluding
# elements that satisfy the block.

# Example:

a = [1, 2, 3]
a.my_reject { |num| num > 1 } # => [1]
a.my_reject { |num| num == 4 } # => [1, 2, 3]
#_______________________________________________________________________________

# My Any
# Write my_any? to return true if any elements of the array satisfy the block 
# and my_all? to return true only if all elements satisfy the block.

# Example:

a = [1, 2, 3]
a.my_any? { |num| num > 1 } # => true
a.my_any? { |num| num == 4 } # => false
a.my_all? { |num| num > 1 } # => false
a.my_all? { |num| num < 4 } # => true
#_______________________________________________________________________________
# Array
#_______________________________________________________________________________

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional 
# array. Hint: use recursion!

# Example:

[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
#_______________________________________________________________________________

# My Zip
# Write my_zip to take any number of arguments. It should return a new array 
# containing self.length elements. Each element of the new array should be an 
# array with a length of the input arguments + 1 and contain the merged elements 
# at that index. If the size of any argument is less than self, nil is returned 
# for that location.

# Example:

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
[1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
[1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
#_______________________________________________________________________________

# My Rotate
# Write a method my_rotate that returns a new array containing all the elements 
# of the original array in a rotated order. By default, the array should rotate
# by one element. If a negative value is given, the array is rotated in the 
# opposite direction.

# Example:

a = [ "a", "b", "c", "d" ]
a.my_rotate         #=> ["b", "c", "d", "a"] 
a.my_rotate(2)      #=> ["c", "d", "a", "b"]
a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
a.my_rotate(15)     #=> ["d", "a", "b", "c"]
#_______________________________________________________________________________

# My Join
# my_join returns a single string containing all the elements of the array, 
# separated by the given string separator. If no separator is given, an empty 
# string is used.

# Example:

a = [ "a", "b", "c", "d" ]
a.my_join         # => "abcd"
a.my_join("$")    # => "a$b$c$d"
#_______________________________________________________________________________

# My Reverse
# Write a method that returns a new array containing all the elements of the 
# original array in reverse order.

# Example:

[ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
[ 1 ].my_reverse               #=> [1]
#_______________________________________________________________________________

# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

factors(12) #=> [2, 3, 4, 6]
#_______________________________________________________________________________


# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.