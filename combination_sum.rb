# 39. Combination Sum
# Medium
# Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

# The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the 
# frequency
#  of at least one of the chosen numbers is different.

# The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

 

# Example 1:

# Input: candidates = [2,3,6,7], target = 7
# Output: [[2,2,3],[7]]
# Explanation:
# 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
# 7 is a candidate, and 7 = 7.
# These are the only two combinations.
# Example 2:

# Input: candidates = [2,3,5], target = 8
# Output: [[2,2,2,2],[2,3,3],[3,5]]
# Example 3:

# Input: candidates = [2], target = 1
# Output: []


# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  # dup candidates
  # dup_candidates = []
  # candidates.each do |c|
  #   multiple = 1
  #   multiple += 1 while (multiple * c) <= target
  #   multiple.times { dup_candidates.append(c) }
  # end
  # combinations = []

  # (1..target).each do |i|
  #   combinations += candidates.repeated_permutation(i).filter { |c| c.sum == target }
  # end

  # combinations
  candidates.map { |c| target - c }.sum(&f)
  # [n-5,n-2,n-3].sum(&f)
end

def f(n)
  if n < 5
    return 0 if n == 1
    return 1
  else
    [n - 5, n - 2, n - 3].sum(&f)
  end
end

f = ->n { n < 5 ? (n == 1) ? 0 : 1 : [n - 5, n - 2, n - 3].sum(&f) }

# raise 'fail' unless combination_sum([2,3,6,7], 7) == [[2,2,3],[7]]
puts combination_sum([2, 3, 6, 7], 7).to_s
