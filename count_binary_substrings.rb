# @param {String} s
# @return {Integer}
# def count_binary_substrings(s)
#   substring_count = 0

#   # find neighboring 1s and 0s, move outwards?
#   (0...s.length).each do |i|
#     (i...s.length).each do |j|
#       substring_count += 1 if valid_substring?(s[i..j])
#     end
#   end

#   substring_count
# end

def count_binary_substrings(s)
  s.scan(/0+|1+/).map(&:length).each_cons(2).sum(&:min)
end

# @param {String} s
# @return {Boolean}
def valid_substring?(substring)
  return false if substring.empty?

  a = substring.split('')
  return false unless a.length.even?

  left, right = a.each_slice((a.size / 2)).to_a
  return false unless left.uniq.size <= 1
  return false unless right.uniq.size <= 1
  return false if left.uniq == right.uniq

  true
end

# Input: s = "00110011"
# Output: 6
# Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
# Notice that some of these substrings repeat and are counted the number of times they occur.
# Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.
puts count_binary_substrings('00110011')

# Input: s = "10101"
# Output: 4
# Explanation: There are 4 substrings: "10", "01", "10", "01" that have equal number of consecutive 1's and 0's.
puts count_binary_substrings('10101')
