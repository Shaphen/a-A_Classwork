# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            return nil
        else
            # first_el = self.sort[0]
            # last_el = self.sort[-1]
            # return last_el - first_el
            first_el = self.min
            last_el = self.max
            return last_el - first_el
        end
    end

    def average
        return nil if self == []

        self.sum / self.length.to_f
    end
    
    def median
        return nil if self.empty?
        idx = (self.length / 2)

        if self.length.odd?
            self.sort[idx]
        else
            (self.sort[idx-1] + self.sort[idx]) / 2.0
        end
    end
    
    def counts
        hash = Hash.new(0)
        self.each {|el| hash[el] += 1}
        hash
    end

    def my_count(val)
        count = 0
        self.each {|el| count += 1 if el == val}
        count
    end

    def my_index(val)
        self.each_with_index do |el,i|
            if el == val
                return i
            end
        end
        return nil 
    end

    def my_uniq
        hash = self.counts.keys
    end
    
    def my_transpose
        results = []

        self.each_with_index do |el1, i1|
            var = []
            self.each_with_index do |el2, i2|
                var << self[i2][i1]
            end
            results << var
        end

        results
    end
    
end