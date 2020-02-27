# def all_words_capitalized? (arr)
#     arr.all? { |word| word == word.capitalize }
# end

# def no_valid_url? (arr)
#     val_urls = ['.com', '.net', '.io', '.org']

#     arr.none? do |url|
#         val_urls.any? { |ending| url.end_with?(ending) }
#     end

# end

# def any_passing_students? (students)

#     students.any? do |student|
#         added = student[:grades].sum
#         (added / student[:grades].length) > 75
#     end

# end

#_______________________________________________________________________________
 # DO IT AGAIN!!!
#_______________________________________________________________________________

def all_words_capitalized? (arr)

    arr.all? { |word| word == word.capitalize }

end

def no_valid_url? (arr)
    valid = ['com', 'net', 'io', 'org']

    arr.none? do |url|
        splitted = url.split('.')
        valid.include?(splitted[-1])
    end
    
end

def any_passing_students? (students)

    students.any? do |student|
        average = (student[:grades].sum) / student[:grades].length
        average > 75
    end
    
end