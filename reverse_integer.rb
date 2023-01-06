# 7. Reverse Integer
# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

# Example 1:

# Input: x = 123
# Output: 321
# Example 2:

# Input: x = -123
# Output: -321
# Example 3:

# Input: x = 120
# Output: 21

# @param {Integer} x
# @return {Integer}
def reverse(x)
  is_negative = x < 0
  s = is_negative ? x.to_s[1..] : x.to_s
  i = s.reverse.to_i

  return 0 if (i > 2**31 - 1) || (i < -2**31)
  is_negative ? i * -1 : i
end

puts "#{reverse(123)} == 321"
puts "#{reverse(-123)} == -321"
puts "#{reverse(120)} == 21"
