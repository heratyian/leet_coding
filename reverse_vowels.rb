# Given a string s, reverse only all the vowels in the string and return it.

# The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

 

# Example 1:

# Input: s = "hello"
# Output: "holle"
# Example 2:

# Input: s = "leetcode"
# Output: "leotcede"
 

# Constraints:

# 1 <= s.length <= 3 * 105
# s consist of printable ASCII characters. 

# @param {String} s
# @return {String}
require 'set'

def reverse_vowels(s)
  vowels = []

  s.split('').each do |c|
    vowels << c if vowel?(c)
  end

  s.split('').map { |c| vowel?(c) ? vowels.pop : c }.join ''
end

def vowel?(char)
  Set['a', 'e', 'i', 'o', 'u'].include? char.downcase
end
