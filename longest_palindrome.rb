# 5. Longest Palindromic Substring
# Medium
# Given a string s, return the longest palindromic substring in s.

# class String
#   def palindrome?
#     self == reverse
#   end
# end

# Input: s = "babad"
# Output: "bab"
# Explanation: "aba" is also a valid answer.

# Input: s = "cbbd"
# Output: "bb"

# @param {String} s
# @return {String}
def longest_palindrome(s)
  longest = ''

  s.length.times do |i|
    odd = expanding_range(s, i, i)
    even = expanding_range(s, i, i + 1)
    current_longest = [odd, even].max_by(&:length)
    longest = [longest, current_longest].max_by(&:length)
  end

  longest
end

def expanding_range(word, left, right)
  while left >= 0 && right < word.length && word[left] == word[right]
    left -= 1
    right += 1
  end

  word[left + 1..right - 1]
end

puts "#{longest_palindrome('babad')} == 'bab' or 'aba'"
puts "#{longest_palindrome('cbbd')} == 'bb'"
