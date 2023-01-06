# In this problem we consider unsigned 30-bit integers, i.e. all integers B such that 0 ≤ B < 230.

# We say that integer A conforms to integer B if, in all positions where B has bits set to 1, A has corresponding bits set to 1.

# For example:

# 00 0000 1111 0111 1101 1110 0000 1111(BIN) = 16,244,239 conforms to 
# 00 0000 1100 0110 1101 1110 0000 0001(BIN) = 13,032,961, but
# 11 0000 1101 0111 0000 1010 0000 0101(BIN) = 819,399,173 does not conform to 
# 00 0000 1001 0110 0011 0011 0000 1111(BIN) = 9,843,471.
# Write a function:

# def solution(a, b, c)
# that, given three unsigned 30-bit integers A, B and C, returns the number of unsigned 30-bit integers conforming to at least one of the given integers.

# For example, for integers:

# A = 11 1111 1111 1111 1111 1111 1001 1111(BIN) = 1,073,741,727,
# B = 11 1111 1111 1111 1111 1111 0011 1111(BIN) = 1,073,741,631, and
# C = 11 1111 1111 1111 1111 1111 0110 1111(BIN) = 1,073,741,679,
# the function should return 8, since there are 8 unsigned 30-bit integers conforming to A, B or C, namely:

# 11 1111 1111 1111 1111 1111 0011 1111(BIN) = 1,073,741,631,
# 11 1111 1111 1111 1111 1111 0110 1111(BIN) = 1,073,741,679,
# 11 1111 1111 1111 1111 1111 0111 1111(BIN) = 1,073,741,695,
# 11 1111 1111 1111 1111 1111 1001 1111(BIN) = 1,073,741,727,
# 11 1111 1111 1111 1111 1111 1011 1111(BIN) = 1,073,741,759,
# 11 1111 1111 1111 1111 1111 1101 1111(BIN) = 1,073,741,791,
# 11 1111 1111 1111 1111 1111 1110 1111(BIN) = 1,073,741,807,
# 11 1111 1111 1111 1111 1111 1111 1111(BIN) = 1,073,741,823.
# Write an efficient algorithm for the following assumptions:

# A, B and C are integers within the range [0..1,073,741,823].

def solution(a, b, c)
  # mask == "111111111111111111111100001111"
  # mask = a & b & c

  # [4,5,6,7]
  unset_positions = unset_bit_positions(a & b & c)

  possible_match_count = unset_positions.count**2

  conforming_numbers_count = 0
  # iterate 0 -> possible_match_count
  (0...possible_match_count).each do |i|
    # [0] -> [1,1,1,1]
    binary = i.digits(2)

    # create possible match
    possible_match = a & b & c
    (0...unset_positions.count).each do |j|
      # 1 || 0
      state = binary[j] || 0
      # 4 || 5 || 6 || 7
      position = unset_positions[j]
      possible_match = modify_bit(possible_match, position, state)
    end

    # conforms to A, B, or C?
    if possible_match & a == a || possible_match & b == b || possible_match & c == c
      conforming_numbers_count += 1
    end
  end

  conforming_numbers_count
end

def unset_bit_positions(number)
  digits = []
  (0...30).each do |i|
    digits.append(number.digits(2)[i] || 0)
  end

  positions = []

  digits.each_with_index do |digit, i|
    positions.append(i) if digit.zero?
  end

  positions
end

def modify_bit(number, position, state)
  mask = 1 << position

  (number & ~mask) | (-state & mask)
end

def set_bit(number, position)
  mask = 1 << position

  number | mask
end

def bit_set?(number, position)
  shifted = number >> position

  shifted & 1
end

# should return 8
# puts solution(1_073_741_727, 1_073_741_631, 1_073_741_679)

# issues
# For example, for the input (0, 0, 0) the solution returned a wrong answer (got 1 expected 1073741824).

# should return 1073741824
puts solution(0, 0, 0)
