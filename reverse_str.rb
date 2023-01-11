# Given a string s and an integer k, reverse the first k characters for every 2k characters counting from the start of the string.

# If there are fewer than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and leave the other as original.

# Constraints:

# 1 <= s.length <= 104
# s consists of only lowercase English letters.
# 1 <= k <= 104

# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
  output = s.chars
  i = 0
  until i >= s.length do
    output[i...i + k] = output[i...i + k].reverse
    i += 2 * k
  end
  output.join('')
end

require 'minitest/autorun'

class ReverseStrTest < Minitest::Test
  def test_example1
    assert_equal('bacdfeg', reverse_str('abcdefg', 2))
  end

  def test_example2
    assert_equal('bacd', reverse_str('abcd', 2))
  end

  def test_example3
    assert_equal('cbadef', reverse_str('abcdef', 3))
  end

  def test_example4
    assert_equal(
      'fdcqkmxwholhytmhafpesaentdvxginrjlyqzyhehybknvdmfrfvtbsovjbdhevlfxpdaovjgunjqllgsqddebemjanqcqnfkjmi',
      reverse_str('hyzqyljrnigxvdtneasepfahmtyhlohwxmkqcdfehybknvdmfrfvtbsovjbdhevlfxpdaovjgunjqlimjkfnqcqnajmebeddqsgl', 39)
    )
  end

  def test_example5
    assert_equal('dcbaefg', reverse_str('abcdefg', 4))
  end
end
