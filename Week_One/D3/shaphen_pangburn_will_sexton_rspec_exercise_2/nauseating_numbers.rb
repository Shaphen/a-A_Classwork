def strange_sums(arr)
    counter = 0
    arr.each_with_index do |el1, idx1|
        arr.each_with_index do |el2, idx2|
            if el1 + el2 == 0 && idx2 > idx1
                counter += 1
            end
        end
    end
    counter
end
​
def pair_product(arr, num)
    arr.any? do |ele1|
        arr.any? {|ele2| ele2 * ele1 == num && ele1 != ele2}
    end
end
​
​
def rampant_repeats(str, hash)
    hash.each { |k,v| str = str.split(k).join(k * v) }
    str
end
​
​
def perfect_square (num)
    (1..num / 2).any? { |factor| num == factor * factor }
end
​
​
def anti_prime? (num)
    arr = (1..num).map do |bigNum|
        (1..bigNum).count { |smallNum| bigNum % smallNum == 0 }
    end
    arr.max == arr[-1]
end
​
​
def matrix_addition(m1,m2)
    result = []
    (0...m1.length).each do |i|
        subresult = []
        (0...m1[i].length).each do |j|
            subresult.push(m1[i][j] + m2[i][j])
        end
        result.push(subresult)
    end
    result
end
​
def mutual_factors (*nums)
​
    (1..nums[0]).select do |factor| 
        
        nums.all? { |num| num % factor == 0 }
​
    end
    
end
​
def tribonacci_number (num)
​
    tri = [1, 1, 2]
​
    while tri.length < num
        tri.push(tri[-1] + tri[-2] + tri[-3])
    end
    
    tri[num - 1]
end
​
​
def matrix_addition_reloaded (*matrices)
    matrices.inject do |acc, matrix| 
        return nil if acc.length != matrix.length || acc[0].length != matrix[0].length
        matrix_addition(acc,matrix)
    end
end
​
def squarocol? (arr)
​
    (0...arr.length).any? do |i|
        (0...arr.length).all? do |j|
            arr[i][0] == arr[i][j] || arr[0][i] == arr[j][i]
        end
    end
​
end
​
def squaragonal? (matrix)
    diag1 = (0...matrix.length).all? {|i| matrix[0][0] == matrix[i][i]} 
    diag2 = (0...matrix.length).all? {|i| matrix[0][-1] == matrix[i][-(i+1)]}
    diag1 || diag2
end
​
def pascals_triangle (num)
    result = [[1]]
    while result.length < num
        nextRow = next_row(result[-1])
        result.push(nextRow)
    end
    result
end
def next_row (arr)
    result = [1]
    (0...arr.length - 1).each { |i| result.push(arr[i] + arr[i + 1]) }
    result.push(1)
end
​
​
def power_of_two? (num)
    return true if num == 1
    return false if num % 2 != 0
    return power_of_two? (num / 2)
end
​
​
def mersenne_prime(num)
    # counter = 0 #counts mercenne primes found
    # i = 2 #number we are checking for mercenne prime
    # while counter < num
    #     i += 1
    #     if is_prime?(i) && power_of_two?(i+1)
    #         counter += 1
    #     end
    # end
    # i
    result = []
    i = 1
    while result.length < num
        result.push(2 ** i - 1) if is_prime?(2 ** i - 1)
        i += 1
    end
    result[-1]
end
​
def is_prime?(num) 
    (2...num).each{|n| return false if num % n == 0}
    num > 1
end
​
​
def triangular_word?(word)
    triaangular_number(word_number(word))
end
​
def word_number(word)
    alp = "~abcdefghijklmnopqrstuvwxyz"
    word.split("").inject(0) do |acc, letter|
        alp.index(letter) + acc
    end
end
​
def triaangular_number(num)
    i = 1
    while (i * (i + 1)) / 2 < num
        i += 1 
    end
    trinum = (i * (i + 1)) / 2
    trinum <= num
end
​
​
def consecutive_collapse(arr)
    sorted = false;
    while !sorted
        sorted = true
        arr.each_with_index do |num, idx|
            if arr[idx]+1 == arr[idx+1] || arr[idx]-1 == arr[idx+1]
                sorted = false
                2.times {arr.delete_at(idx)}
                break
            end
        end
    end
    arr
end
​
​
​
def is_prime?(num) 
    (2...num).each{|n| return false if num % n == 0}
    num > 1
end
​
def pretentious_primes (arr, n) 
    if n > 0
        arr.map do |ele|
            n.times{ele = next_prime(ele)}
            ele
        end
    else
        arr.map do |ele|
            (-1 * n).times{ele = prev_prime(ele)}
            ele
        end
    end
end
​
def next_prime (num)
    while !is_prime?(num + 1)
        num += 1
    end
    num + 1
end
​
def prev_prime (num)
    return nil if num == nil || num < 3 
    while !is_prime?(num - 1)
        num -= 1
    end
    num - 1
end