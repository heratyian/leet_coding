# 14. Longest Common Prefix
# Easy
# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  common_prefix = ''

  strs[0].length.times do |char_index|
    char = strs[0][char_index]
    break unless strs.all? { |w| w[char_index] == char }

    common_prefix += char
  end

  common_prefix
end

puts "#{longest_common_prefix(%w[flower flow flight])} == fl"
puts "#{longest_common_prefix(%w[dog racecar car])} == "
