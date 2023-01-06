# 1. Two Sum
# Easy
# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

 

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:

# Input: nums = [3,3], target = 6
# Output: [0,1]


# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# def two_sum(nums, target)
#   # put numbers in hash
#   h = {}
#   nums.each_with_index { |num, i| h[num] = i }
#   nums.each_with_index do |num, i|
#     diff = target - num
#     return [i, h[diff]] if h.key?(diff) && h[diff] != i
#   end
# end

def two_sum(nums, target)
  summand_hash = nums.map.with_index { |x, i| [x, i] }.to_h
  
  nums.each_with_index do |num, index|
      summand_index = summand_hash[(target - num)]
      next if summand_index == index
      next if summand_index.nil?

      return [index, summand_index]
  end
end