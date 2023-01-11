# Given two strings s and goal, return true if and only if s can become goal after some number of shifts on s.

# A shift on s consists of moving the leftmost character of s to the rightmost position.

# For example, if s = "abcde", then it will be "bcdea" after one shift.

# Constraints:

# 1 <= s.length, goal.length <= 100
# s and goal consist of lowercase English letters.

# @param {String} s
# @param {String} goal
# @return {Boolean}
def rotate_string(s, goal)
  chars = s.chars
  s.length.times do
    char = chars.shift
    chars.push(char)
    return true if chars.join('') == goal
  end

  false
end

require 'minitest/autorun'

class RotateStringTest < Minitest::Test
  def test_example1
    assert_equal(true, rotate_string('abcde', 'cdeab'))
  end

  def test_example2
    assert_equal(false, rotate_string('abcde', 'abced'))
  end
end
