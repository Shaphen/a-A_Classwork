
class Array

    
    def my_each(&prc)
        idx = 0
        while idx < self.length
            prc.call(self[idx])
            idx += 1
        end
        self
    end

    def my_select(&prc)
        result = []
        self.my_each do |ele|
            result << ele if prc.call(ele)
        end
        result
    end

    def my_reject(&prc)
        result = []
        self.my_each do |ele|
            result << ele if !prc.call(ele)
        end
        result
    end
    
    def my_any?(&prc)
        self.my_each do |ele|
            return true if proc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !proc.call(ele)
        end
        true
    end

    def my_flatten
        arr = []
        return [self] if !self.is_a?(Array)
        self.my_each do |ele| 
            if ele.is_a?(Array) 
                arr += ele.my_flatten
            else
                arr << ele
            end
        end
        arr
    end

    def my_zip(*args)
        result = Array.new(self.length) {Array.new(args.length + 1)}

        self.each_with_index do |ele, idx1|
            col = []
            col << self[idx1]
            args.each do |sub|
                col << sub[idx1]
            end
            result[idx1] = col
        end

        result
    end

    def my_rotate(num=1)
        rotated = [] 
        self.each_with_index do |ele, idx| 
            rotated << self[(idx + num) % self.length] 
        end
        return rotated
    end

    def my_join(sep= "")
        joined = ""
        self.each do |char|
            joined += "#{char}#{sep}"
            
        end
        if sep == ""
            return joined
        else
            return joined[0...-1]
        end
    end
    
    def my_reverse
        reversed = []
        i = self.length - 1
        while i >= 0
            reversed << self[i]
            i -= 1
        end
        # self.each_with_index do |ele,idx|
        #     reversed << self[-idx - 1]
        # end
        reversed
    end

    def bubble_sort!(&prc)
        
    end
    
end

def factors(num)
    factors = []

    (2...num).each do |n|
        factors << n if num % n == 0
    end
    
    factors
end
