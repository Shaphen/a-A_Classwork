# def proper_factors(num)

#     (1...num).select { |factor| num % factor == 0 }

# end

# def aliquot_sum(num)

#     proper_factors(num).sum
    
# end

# def perfect_number?(num)

#     aliquot_sum(num) == num

# end

# def ideal_numbers(n)
#     idealz = []

#     i = 1
#     while idealz.length < n
#         if perfect_number?(i)
#             idealz << i
#         end

#         i += 1
#     end
#     idealz
# end

#_______________________________________________________________________________
 # DO IT AGAIN!!!
#_______________________________________________________________________________

def proper_factors (num)
    factors = []

    (1...num).map { |n| factors << n if num % n == 0 }
    
    factors
end

def aliquot_sum (num)

    proper_factors(num).sum

end

def perfect_number? (num)

    num == aliquot_sum(num)
    
end

def ideal_numbers (num)
    ideals = []
    i = 1

    while ideals.length < num
        ideals << i if perfect_number?(i)
        i += 1
    end
    
    ideals
end