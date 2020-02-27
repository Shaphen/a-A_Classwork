def is_prime? (num)

    return false if num < 2

    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end

    true
end

def nth_prime (num)
    primes = []
    i = 2

    while primes.length < num
        primes << i if is_prime?(i)
        i += 1
    end
    
    primes[-1]
end

def prime_range (min, max)
    answers = []

    (min..max).each do |num|
        answers << num if is_prime?(num)
    end
    
    answers
end