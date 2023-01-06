# Given a m x n matrix mat and an integer k, return a matrix answer where each answer[i][j] is the sum of all elements mat[r][c] for:

# i - k <= r <= i + k,
# j - k <= c <= j + k, and
# (r, c) is a valid position in the matrix.
 

# Example 1:

# Input: mat = [[1,2,3],[4,5,6],[7,8,9]], k = 1
# Output: [[12,21,16],[27,45,33],[24,39,28]]
# Example 2:

# Input: mat = [[1,2,3],[4,5,6],[7,8,9]], k = 2
# Output: [[45,45,45],[45,45,45],[45,45,45]]
 

# Constraints:

# m == mat.length
# n == mat[i].length
# 1 <= m, n, k <= 100
# 1 <= mat[i][j] <= 100


# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer[][]}
def matrix_block_sum(mat, k)
  answer_matrix = Array.new(mat.count) { Array.new(mat[0].count) }
  answer_matrix.count.times do |i|
    r = ((i - k)..(i + k))
    answer_matrix[i].count.times do |j|
      c = ((j - k)..(j + k))
      answer_matrix[i][j] = mat_sum(mat, r, c)
    end
  end
  answer_matrix
end

def mat_sum(m, r, c)
  sum = 0
  r.each do |r_index|
    next unless r_index >= 0
    next unless r_index < m.count

    c.each do |c_index|
      next unless c_index >= 0
      next unless c_index < m[0].count

      sum += m[r_index][c_index]
    end
  end
  sum
end

output = matrix_block_sum([[1,2,3],[4,5,6],[7,8,9]], 1)
puts output
