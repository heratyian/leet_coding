# 11. Container With Most Water
# Medium
# Companies
# You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

# Find two lines that together with the x-axis form a container, such that the container contains the most water.

# Return the maximum amount of water a container can store.

# Notice that you may not slant the container.

 

# Example 1:


# Input: height = [1,8,6,2,5,4,8,3,7]
# Output: 49
# Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
# Example 2:

# Input: height = [1,1]
# Output: 1


# @param {Integer[]} height
# @return {Integer}
# def max_area(height)
#   max_area = 0

#   # height = [h1, h2].min
#   # width = i2 - i1
#   # area = height * width
#   # max_area = area if area > max_area

#   height.each_with_index do |h1, i|
#     # could replace with array starting at i .each
#     height[(i + 1)..].each_with_index do |h2, j|
#       puts "h1: #{h1}, h2: #{h2}, i: #{i}, j:#{j + i + 1}"
#       current_height = [h1, h2].min
#       current_width = j + i + 1 - i
#       current_area = current_height * current_width
#       puts "area: #{current_area}"
#       max_area = current_area if current_area > max_area
#     end
#   end

#   max_area
# end

def max_area(heights)
  max_area = 0
  i = 0
  j = heights.length - 1

  while i < j
    width = j - i
    height = [heights[i], heights[j]].min
    area = height * width
    max_area = [max_area, area].max

    heights[i] < heights[j] ? i += 1 : j -= 1
  end

  max_area
end

puts "#{max_area([1,8,6,2,5,4,8,3,7])} == 49"
puts "#{max_area([1,1])} == 1"
