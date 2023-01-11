# Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

# Constraints:

# 1 <= nums.length <= 5 * 104
# -109 <= nums[i] <= 109

# Follow up: Could you solve the problem in linear time and in O(1) space?

# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  n = nums.length
  min_count = n.to_f / 3
  majority_nums = []
  nums.uniq.each do |num|
    majority_nums.push(num) if nums.count(num) > min_count
  end
  majority_nums
end

require 'minitest/autorun'

class MajorityElementTest < Minitest::Test
  def test_example1
    assert_equal([3], majority_element([3, 2, 3]))
  end

  def test_example2
    assert_equal([1], majority_element([1]))
  end

  def test_example3
    assert_equal([1, 2], majority_element([1, 2]))
  end
end
