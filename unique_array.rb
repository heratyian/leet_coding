def solution(a)
  uniques = []
  duplicates = []

  a.each do |num|
    if uniques.include?(num)
      uniques.delete(num)
      duplicates.append(num)
    elsif !duplicates.include?(num)
      uniques.append(num)
    end
  end

  puts "uniques: #{uniques}"
  puts "duplicates: #{duplicates}"
  uniques.any? ? uniques[0] : -1
end


solution([4, 10, 5, 4, 2, 10])
