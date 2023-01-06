# Write a function:

# def solution(a, x)

# that, given an array A of N integers (containing the lengths of the available pieces of fence) and an integer X, returns the number of different ways of building a rectangular pen satisfying the above conditions. The function should return −1 if the result exceeds 1,000,000,000.

# For example, given X = 5 and the following array A:

#   A[0] = 1
#   A[1] = 2
#   A[2] = 5
#   A[3] = 1
#   A[4] = 1
#   A[5] = 2
#   A[6] = 3
#   A[7] = 5
#   A[8] = 1

def solution(a, x)
  pairs = []
  a.tally.map do |k, v|
    (v/2).times do
      pairs.append(k)
    end
  end

  # pairs = [1, 1, 2, 5]

  # create list of combinations
  valid_boxes = []

  pairs.each_with_index do |pair_i, i|
    ((i + 1)..pairs.length).each do |j|
      pair_j = pairs[j]
      break if pair_j.nil?

      new_pair = [pair_i, pair_j]
      valid_boxes.append(new_pair) if (pair_i * pair_j >= x) && valid_boxes.none?(new_pair)
    end
  end

  valid_boxes.count
end

# the function should return 2.
puts solution([1, 2, 5, 1, 1, 2, 3, 5, 1], 5)
