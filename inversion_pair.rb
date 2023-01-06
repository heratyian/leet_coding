def solution(a)
  inversion_count = 0

  (0...a.length).each do |i|
    (i...a.length).each do |j|
      inversion_count += 1 if a[i] > a[j]
    end
  end

  inversion_count
end

array = [-1, 6, 3, 4, 7, 4]

# should return 4
puts solution(array)
