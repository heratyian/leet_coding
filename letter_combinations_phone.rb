def letter_combinations(digits)
  return [] if digits.empty?

  digit_to_letters = {
    '0': [],
    '1': [],
    '2': ['a', 'b', 'c'],
    '3': ['d', 'e', 'f'],
    '4': ['g', 'h', 'i'],
    '5': ['j', 'k', 'l'],
    '6': ['m', 'n', 'o'],
    '7': ['p', 'q', 'r', 's'],
    '8': ['t', 'u', 'v'],
    '9': ['w', 'x', 'y', 'z'],
  }

  current_digit = digits.split('')[0]
  remaining_digits = digits.split('')[1..]
  return digit_to_letters[current_digit.to_sym] unless remaining_digits.any?

  letters = digit_to_letters[current_digit.to_sym]
  letters.map { |letter| letter_combinations(remaining_digits.join).map { |combination| letter + combination } }.flatten
end

puts letter_combinations('234')
