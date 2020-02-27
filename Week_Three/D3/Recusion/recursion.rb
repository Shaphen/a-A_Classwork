require 'byebug'
#RECURSION

def range(start, last)
    return [] if last <= start 
    range(start, last - 1) + [(last - 1)]
end
# p range(1, 5) #=> [1,2,3,4]

def sum(arr)
    return arr[0] if arr.length <= 1

    sum(arr[1..-1]) + arr[0]
end
# p sum([1, 2, 3, 4]) # => 10

def it_sum(arr)
    arr.inject { |sum, num| sum + num }
end
# p sum([1, 2, 3, 4]) # => 10

def exp(b, p)
    return 1 if p == 0
    return b if p == 1


    exp(b, p-1) * b
end
# recursion 1
# exp(b, 0) # = 1
# exp(b, n) # = b * exp(b, n - 1)

def exp_2(b, p)
    return 1 if p == 0
    return b if p == 1

    if n.even?
        form = exp(b, n / 2)
        form * form
    else
        form = exp(b, (n - 1) / 2)
        b * form * form
    end
end

# p exp(2, 2) #=> 4
# p exp(2, 4) #=> 16
# p exp(4, 0) #=> 1
# p exp(3, 7) #=> 2187

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             #[for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) #[for odd n]
class Array
    def deep_dup
        return self.dup if !self.is_a?(Array)
        new_arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr << ele.deep_dup
            else
                new_arr << ele
            end
        end
        new_arr
    end
end
# p arr = [1, [2], [3, [4]]]
# p new_arr = arr.deep_dup
# p new_arr[1] << 2
# p new_arr
# p arr

def Fibonacci(n)
    return [0] if n == 0
    return [1] if n == 1
    return [0,1] if n == 2

    prev_fib = Fibonacci(n - 1)
    result = prev_fib[-1] + prev_fib[-2]
    prev_fib << result
    prev_fib
end
# p Fibonacci(5) # => [0, 1, 1, 2, 3]
# p n = 3 [0,1,1]
# p n = 2 [0,1] 
# p n = 1 [1]
# p n = 0 [0]

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34   

def bsearch(array, target)
    return nil if array.length == 1 && array[0] != target
    mid_i = (array.length - 1) / 2 

    if array[mid_i] == target
        return mid_i
    elsif array[mid_i] < target
        new_idx = bsearch(array[mid_i+1..-1], target) 
        result = (new_idx == nil) ? nil : (new_idx + 1) + mid_i
        # result = new_idx + mid_i 
    else
        # new_idx = bsearch(array[0..mid_i], target) 
        # result = new_idx
        return bsearch(array[0..mid_i], target) 
    end
    result
end
# debugger
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(arr1, arr2)# 
    new_arr = []
    while !arr1.empty? && !arr2.empty?

        if arr1.first >= arr2.first 
            new_arr << arr2.first
            arr2 = arr2.drop(1) 
        else
            new_arr << arr1.first #
            arr1 = arr1.drop(1)
        end        
    end
    if !arr1.empty?
        new_arr += arr1
    elsif !arr2.empty?
        new_arr += arr2
    end
    # new_arr + arr1 + arr2 works too
    new_arr
end

def merge_sort(arr)
    return arr if arr.length <= 1
    mid_i = (arr.length - 1) / 2
    arr1 = arr[0..mid_i]
    arr2 = arr[mid_i+1..-1]
    
    merge(merge_sort(arr1), merge_sort(arr2))
end
arr = [3, 6, 2, 7, 3, 8, 4, 5, 5, 6, 8, 4]
# debugger
# p merge_sort(arr) #=> [2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 8, 8]



# EVERYTHING ABOVE IS FAIR GAME FOR RUBY 1 ASSESSMENT



def subsets(arr)
    return [[]] if arr.empty?

    prev_sub = subsets(arr[0...-1])
    added = prev_sub.map { |subarr| subarr.dup << arr.last }
    prev_sub + added
end

# # p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
    return [arr] if arr.length == 1
    num = arr.length - 1 #2
    new_arr = []
    
    prev_perm = permutations(arr[0...-1]) #[[1, 2], [2, 1]]
    added = prev_perm.map { |subarr| subarr.dup << arr.last } 
    added.each do |subarr| #[1,2,3] #[2,1,3]
        new_arr << subarr
        temp_arr = subarr.dup
        i = 1
        while i <= num do
            new_arr << temp_arr.rotate(i) # [2,3,1] >[3,1,2] #[1,3,2] >[3,2,1]
            i += 1
        end
    end

    new_arr
end


# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]

#Examples
# p [1].permutation.to_a #[[1]]

# p [1, 2].permutation.to_a #[[1, 2], [2, 1]] #n = arr.length - 1 

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                                  [2, 1, 3], [2, 3, 1],
#                                  [3, 1, 2], [3, 2, 1]]
#[1,2,3] > [2,3,1] >[3,1,2]
#[2,1,3] > [1,3,2] >[3,2,1]

def greedy_make_change(num, arr)
    return [0] if num == 0
    coins = arr.sort.reverse
    change = []
    while num != 0
        n = num / coins[0]
        if n >= 1
            n.times{change << coins[0]}
            change += greedy_make_change(num - n*coins[0], coins[1..-1])
        else 
            change += greedy_make_change(num, coins[1..-1])
        end
    end
    change
end
# debugger
# p greedy_make_change(24, [7, 1, 10])
