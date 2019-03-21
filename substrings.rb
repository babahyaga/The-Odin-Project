
=begin
Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
=end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string)
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    array = string.split(' ')
    if array.any? {|word| dictionary.include?(word)}
       words_to_remove = array - dictionary
       filtered_array = array - words_to_remove
       counts = Hash.new 0  
            filtered_array.each do |word|
                counts[word] += 1
            end
    return counts
    end
end

"this is just a big down below we go test go go go"