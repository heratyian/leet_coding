# 9. Palindrome Number
# Given an integer x, return true if x is a 
# palindrome
# , and false otherwise.

class Integer
  def to_a
    a = []
    x = self
    while x.positive?
      a.prepend x % 10
      x /= 10
    end
    a
  end
end

# Example 1:

# Input: x = 121
# Output: true
# Explanation: 121 reads as 121 from left to right and from right to left.
# Example 2:

# Input: x = -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:

# Input: x = 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

# @param {Integer} x
# @return {Boolean}
# def is_palindrome(x)
#   x.to_s.reverse == x.to_s
# end

def is_palindrome(x)
  return false if x < 0

  num_array = x.to_a
  tail = num_array.length - 1
  num_array.length.times do |head|
    return true if head > tail

    h_value = num_array[head]
    t_value = num_array[tail]

    return false unless h_value == t_value

    tail -= 1
  end

  true
end

puts "#{is_palindrome(121)} == true"
puts "#{is_palindrome(-121)} == false"
puts "#{is_palindrome(10)} == false"
