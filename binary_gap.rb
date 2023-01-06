# @param {Integer} n
# @return {Integer}
def binary_gap(n)
  position = nil
  max_gap = 0
  current_gap = 0
  i = 0
  while n.positive?
    if n & 1 == 1
      position = i
      max_gap = current_gap if current_gap > max_gap
      current_gap = 1
    elsif position
      current_gap += 1
    end

    n = n >> 1
    i += 1
  end

  max_gap
end

# Input: n = 22
# Output: 2
# Explanation: 22 in binary is "10110".
# The first adjacent pair of 1's is "10110" with a distance of 2.
# The second adjacent pair of 1's is "10110" with a distance of 1.
# The answer is the largest of these two distances, which is 2.
# Note that "10110" is not a valid pair since there is a 1 separating the two 1's underlined.
puts binary_gap(22)

# Input: n = 8
# Output: 0
# Explanation: 8 in binary is "1000".
# There are not any adjacent pairs of 1's in the binary representation of 8, so we return 0.
puts binary_gap(8)

# Input: n = 5
# Output: 2
# Explanation: 5 in binary is "101".
puts binary_gap(5)
