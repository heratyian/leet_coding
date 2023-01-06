def solution(n)
  # write your code in Ruby 2.7
  highest_power = 0
  (1..n).each do |a|
    power = 2**a
    break if power > n

    highest_power = a if (n % power).zero?
  end
  highest_power
end

# should return 3
solution(24)
