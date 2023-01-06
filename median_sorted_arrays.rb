# 4. Median of Two Sorted Arrays

# Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

# The overall run time complexity should be O(log (m+n)).

 

# Example 1:

# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.
# Example 2:

# Input: nums1 = [1,2], nums2 = [3,4]
# Output: 2.50000
# Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

class Array
  def median
    # assume sorted
    midpoint = length / 2.0

    if length.even?
      (self[midpoint] + self[midpoint - 1]) / 2.0
    else
      self[midpoint]
    end
  end
end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

# TODO: make this more greedy, only need to sort up to midpoint
def find_median_sorted_arrays(nums1, nums2)
  a = merge_arrays(nums1, nums2)

  a.median
end

def merge_arrays(a1, a2)
  result = []

  if a1[0] < a2[0]
    result << a1.shift
  else
    result << a2.shift
  end

  return result + a2 if a1.length.zero?
  return result + a1 if a2.length.zero?

  result + merge_arrays(a1, a2)
end

puts "#{find_median_sorted_arrays([1,3], [2])} == 2.00000"
puts "#{find_median_sorted_arrays([1,2], [3,4])} == 2.50000"
