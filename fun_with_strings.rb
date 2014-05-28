module FunWithStrings
  def palindrome?
    word = self.downcase.gsub(/\W/, "")
    word == word.reverse
  end
  
  def count_words
    arr = self.downcase.scan(/\w+/)
    collect = Hash.new(0)
    arr.each {|w| collect[w] += 1}
    return collect
  end
  
  def anagram_groups
    anagrams = []
    self.split(' ').map do |word|
      word.chars.to_a.permutation(word.length).to_a.map(&:join) & self.split
    end
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
