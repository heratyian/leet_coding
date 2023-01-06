# The quick brown fox jumps over the lazy dog

def solution(message, k)
  # k - character limit
  # eg
  # message = "Codility We test coders"
  # k = 14
  # return 'Codility We'
  word_array = message.split(' ')

  output_message = ''

  i = 0
  while output_message.length < k
    next_word = word_array[i]
    break if next_word.nil?
    break if (output_message.length + next_word.length + 1) > k

    # add space before unless i == 0
    output_message += ' ' unless i.zero?
    output_message += next_word

    i += 1
  end

  output_message
end


# return "codility we"
# puts solution("Codility We test coders", 14)
# puts solution("Why not", 100)
# puts solution("The quick brown fox jumps over the lazy dog", 39)
puts solution("To crop or not to crop", 21)

