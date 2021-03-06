def reverser (str, &prc)
    prc.call(str.reverse!)
end

def word_changer (sen, &prc)

    new_sen = sen.split(" ").map { |word| prc.call(word) }

    new_sen.join(" ")
end

def greater_proc_value (num, prc1, prc2)

    if prc1.call(num) > prc2.call(num)
        prc1.call(num)
    else
        prc2.call(num)
    end

end

def and_selector (arr, prc1, prc2)

    new_arr = arr.select do |ele|
        prc1.call(ele) && prc2.call(ele)
    end

end

def alternating_mapper (arr, prc1, prc2)

    new_arr = arr.each_with_index.map do |ele, ind|
        if ind % 2 != 0
            prc2.call(ele)
        else
            prc1.call(ele)
        end
    end

end