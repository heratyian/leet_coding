# 6. Zigzag Conversion
# Medium
# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

# P   A   H   N
# A P L S I I G
# Y   I   R
# And then read line by line: "PAHNAPLSIIGYIR"

# Write the code that will take a string and make this conversion given a number of rows:

# string convert(string s, int numRows);
 

# Example 1:

# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"
# Example 2:

# Input: s = "PAYPALISHIRING", numRows = 4
# Output: "PINALSIGYAHRPI"
# Explanation:
# P     I    N
# A   L S  I G
# Y A   H R
# P     I
# Example 3:

# Input: s = "A", numRows = 1
# Output: "A"


# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  matrix = create_empty_matrix(num_rows, s)
  matrix = populate_matrix(matrix, s, num_rows)

  matrix.join ''
end

def create_empty_matrix(num_rows, s)
  row_size = s.length / 2

  Array.new(num_rows) { Array.new(row_size, '') }
end

def populate_matrix(matrix, s, num_rows)
  x_index = 0
  y_index = 0

  y_delta = 1
  s.chars.each do |c|
    matrix[y_index][x_index] = c

    y_index += y_delta if num_rows > 1
    x_index += 1 if y_delta.negative? || num_rows == 1
    y_delta = 1 if y_index.zero?
    y_delta = -1 if y_index == num_rows - 1
  end

  matrix
end

puts "'#{convert('PAYPALISHIRING', 3)}' == 'PAHNAPLSIIGYIR'"
puts "'#{convert('PAYPALISHIRING', 4)}' == 'PINALSIGYAHRPI'"
puts "'#{convert('A', 1)}' == 'A'"
puts "'#{convert('AB', 1)}' == 'AB'"
