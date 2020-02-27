# def my_reject(arr, &prc)
#     arr.select { |ele| !prc.call(ele) }
# end

# def my_one?(arr, &prc)
#     count = 0
#     arr.each { |ele| count += 1 if prc.call(ele) }
#     count == 1
# end

# def hash_select(hash, &prc)
#     new_hash = Hash.new

#     hash.each do |k,v|
#         if prc.call(k, v)
#             new_hash[k] = v
#         end
#     end

#     new_hash
# end

# def xor_select(arr, prc1, prc2)
#     selected = []

#     arr.each do |ele|
#         if prc1.call(ele) && !prc2.call(ele) 
#             selected << ele
#         elsif prc2.call(ele) && !prc1.call(ele) 
#             selected << ele
#         end
#     end

#     selected
# end

# def proc_count(val, arr)
#     count = 0
#     arr.each { |prc| count += 1 if prc.call(val) }
#     count
# end


#_______________________________________________________________________________
 # DO IT AGAIN!!!
#_______________________________________________________________________________

def my_reject (arr, &prc)
    new_arr = []

    arr.each { |ele| new_arr << ele if !prc.call(ele) }
    
    new_arr
end

def my_one? (arr, &prc)
    trues = []

    arr.each { |ele| trues << ele if prc.call(ele) }

    trues.length == 1
end

def hash_select (hash, &prc)
    new_hash = {}

    hash.each do |k,v|
        new_hash[k] = v if prc.call(k,v)
    end
    
    new_hash
end

def xor_select (arr, prc1, prc2)
    new_arr = []

    arr.each do |ele|
        if prc1.call(ele) && !prc2.call(ele) || !prc1.call(ele) && prc2.call(ele)
            new_arr << ele
        end
    end
    
    new_arr
end

def proc_count (ele, proc_arr)
    count = 0

    proc_arr.each { |prc| count += 1 if prc.call(ele) }
    
    count
end