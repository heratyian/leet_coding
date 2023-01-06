# Given a string s, find the length of the longest
# substring
#  without repeating characters.

# Example 1:

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
# Example 2:

# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:

# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

# Input: s = "dvdf"
# Output: 3

# Input: s = "ohvhjdml"
# Output: 6

# @param {String} s
# @return {Integer}
# def length_of_longest_substring(s)
#   max_length = 0
#   current_length = 0
#   current_substring_hash = {}
#   s.length.times do |start_index|
#     substring = s[start_index..]
#     substring.split('').each do |char|
#       if current_substring_hash.key?(char)
#         current_substring_hash = {}
#         current_substring_hash[char] = 1
#         current_length = 0
#       else
#         current_substring_hash[char] = 1
#         current_length = current_substring_hash.size
#         max_length = current_length if current_length > max_length
#       end
#     end
#     current_length = 0
#     current_substring_hash = {}
#   end

#   max_length
# end

# def length_of_longest_substring(s)
#   max_length = 0
#   current_substring = ''
#   current_length = 0
#   current_substring_hash = {}
#   s.each_char.with_index do |char, i|
#     puts "char: #{char},
# current_substring: #{current_substring},
# max_length: #{max_length},
# i: #{i}"

#     if current_substring_hash.key?(char)
#       # check if char == current_substring[0] zero index in array and shift over 1?
#       if char == current_substring[0]
#         # remove first letter from current_substring
#         current_substring = current_substring[1..] + char
#       else
#         current_substring_hash = {}
#         current_substring_hash[char] = i
#         current_length = 0
#         current_substring = ''
#       end
#     else
#       current_substring = current_substring + char
#       current_substring_hash[char] = 1
#       current_length = current_substring_hash.size
#       max_length = current_length if current_length > max_length
#     end
#   end

#   max_length
# end

def length_of_longest_substring(s)
  head = 0
  max_length = 0
  skip_hash = {}
  # puts s
  s.each_char.with_index do |char, tail|
    # puts "char: #{char}, tail: #{tail}"
    head = [head, skip_hash[char]].max if skip_hash.key?(char)
    # puts "head: #{head}"
    max_length = [max_length, tail - head + 1].max
    # puts "max_length: #{max_length}"
    skip_hash[char] = tail + 1
  end

  max_length
end

puts length_of_longest_substring('abcabcbb')
puts length_of_longest_substring('bbbbb')
puts length_of_longest_substring('pwwkew')
puts length_of_longest_substring('dvdf')
puts length_of_longest_substring('ohvhjdml')
