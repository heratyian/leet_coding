def solution(p, s)
  # p[] - people
  # s[] - seats
  # n integers each
  # travel with fewest cars

  # [people, seats]
  load_out = [p, s].transpose
  load_out.sort_by! { |car| -car[1] }

  (0..load_out.length).each do |current_loading_index|
    current_loading_car = load_out[current_loading_index]
    current_alight_index = load_out.length - 1
    break unless space_available?(load_out.first(load_out.size - 1))
    break if current_loading_car.nil?
    break if current_loading_index == current_alight_index
    next unless open_seat? current_loading_car

    alight_car = load_out[current_alight_index]

    while open_seat?(current_loading_car)
      current_loading_car[0] += 1
      alight_car[0] -= 1

      load_out.pop if empty_car?(alight_car)
      current_alight_index = load_out.length - 1
      alight_car = load_out[current_alight_index]

      break if current_loading_index == current_alight_index
    end
  end


  # return min # cars needed
  load_out.length
end

# [[4, 5], [1, 1], [1, 1]]
def space_available?(cars)
  cars.any? { |car| open_seat?(car) }
end

# [people, seats]
def open_seat?(car)
  car[0] < car[1]
end

def empty_car?(car)
  car[0].zero?
end

# p = [1,4,1]
# s = [1,5,1]
# return 2
puts solution([1,4,1], [1,5,1])

# p = [4,4,2,4]
# s = [5,5,2,5]
# return 3
# puts solution([4,4,2,4], [5,5,2,5])

# p = [2,3,4,2]
# s = [2,5,7,2]
# return 2
# puts solution([2,3,4,2], [2,5,7,2])
