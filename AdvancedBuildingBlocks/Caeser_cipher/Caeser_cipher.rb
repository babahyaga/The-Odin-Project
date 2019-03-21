=begin
We need a function that :
1.looks at an array of letters going from a-z and 
2.moves a given letter over a given number of spaces 
3..and then returns that letter
=end 

def caeser_cipher(string, shift)
    downcase = ("a".."z").to_a*2
    upcase = ("A".."Z").to_a*2
    string = string.split()
    new_string = []
    string.each do |char|
        if downcase.include?(char)
            new_string.push(downcase[downcase.index(char)+shift])
        elsif upcase.include?(char)
            new_string.push(upcase[upcase.index(char)+shift])
        else  
            new_string.push(char)
        end
    end 
    new_string.join()     
end

def test(string)
    puts string
end
