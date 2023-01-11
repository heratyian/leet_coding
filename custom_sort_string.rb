# You are given two strings order and s. All the characters of order are unique and were sorted in some custom order previously.

# Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.

# Return any permutation of s that satisfies this property.

 



# Constraints:

# 1 <= order.length <= 26
# 1 <= s.length <= 200
# order and s consist of lowercase English letters.
# All the characters of order are unique.

# @param {String} order
# @param {String} s
# @return {String}
def custom_sort_string(order, s)
  s.split('')
   .sort { |x, y| (order.index(x) || Float::INFINITY) <=> (order.index(y) || Float::INFINITY) }
   .join('')
end

require 'minitest/autorun'

class CustomSortStringTest < Minitest::Test
  # Explanation: 
  # "a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a". 
  # Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.
  def test_example1
    assert_equal('cbad', custom_sort_string('cba', 'abcd'))
  end

  def test_example2
    assert_equal('cbad', custom_sort_string('cbafg', 'abcd'))
  end
end
