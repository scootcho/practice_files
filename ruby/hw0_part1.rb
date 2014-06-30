#Define a method sum which takes an array of integers as an argument and returns
#the sum of its elements. For an empty array it should return zero.

=begin COMMENTS 
try use array.inject or array.reduce
refactor : 
return 0 if ....

=end
def sum(array)
  return 0 if array.empty?
  return array.inject { |sum, n| sum += n }
end

# raise "sum([]) != 0" unless sum([]) == 0
# raise "sum([1,2,3,4]) != 10" unless sum([1,2,3,4]) == 10


#Define a method max_2_sum which takes an array of integers as an argument and
#returns the sum of its two largest elements. For an empty array it should 
#return zero. For an array with just one element, it should return that element.

def max_2_sum(array)
  return 0 if array.empty?
  return array[0] if array.size == 1
  a = array.sort.reverse
  return a[0] + a[1]
end

# max_2_sum([1,2,5,45]) == 50
# max_2_sum([0]) == 0
# max_2_sum([52]) == 52


#Define a method sum_to_n? which takes an array of integers and an additional
#integer, n, as arguments and returns true if any two distinct elements in the 
#array of integers sum to n. An empty array or single element array should both 
#return false.

# 
#[1,2,3].combination(2) => [[1,2], [2,3], [3,1]]
def sum_to_n?(array, int)
  unless array.empty? || array.size == 1
    array.combination(2).each do |element| # what you get here is an array of arrays with 2 elements, you just need to apply sum(n) to each and chek
      return true if sum(element) == int # say the array is [1,2,3], using your code this would produce 7, sum up all elements in a variable named sum
    end
  end
  false
end

# puts sum_to_n?([1,2,3], 5) # true
# puts sum_to_n?([1,67,3,5,4,7,5,4], 70) # true
# puts sum_to_n?([1], 4) # false
# puts sum_to_n?([], 4) # false
# puts sum_to_n?([6,5], 4) # should return false

