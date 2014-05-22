#Define a method hello(name) that takes a string representing a name and returns
#the string "Hello, " concatenated with the name.

def hello(name)
    return "Hello, " + name
end

#puts hello("Scott")

#Define a method starts_with_consonant?(s) that takes a string and returns true 
#if it starts with a consonant and false otherwise. (For our purposes, a 
#consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for 
#both upper and lower case and for nonletters!

def starts_with_consonant?(s)
    /^[bcdfghjklmnpqrstvwxyz]/ =~ s.downcase
end

# Test cases
#puts "This should be true: " + starts_with_consonant?("Julie").to_s
#puts "This should be true: " + starts_with_consonant?("julie").to_s
#puts "This should be false: " + starts_with_consonant?("76trombones").to_s
#puts "This should be false: " + starts_with_consonant?("island").to_s


#Define a method binary_multiple_of_4?(s) that takes a string and returns true 
#if the string represents a binary number that is a multiple of 4. NOTE: be sure
#it returns false if the string is not a valid binary number!

def binary_multiple_of_4?(s)
    return true if s == "0"
    return false if 0 == s.to_i(2)
    if s.to_i(2) % 4 == 0
      true
    else
      false
    end
end

# Test cases
#puts binary_multiple_of_4?("hello")
#puts binary_multiple_of_4?("10100")
#puts binary_multiple_of_4?("0")