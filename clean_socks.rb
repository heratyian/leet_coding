
def solution(k, c, d)
  # k = number of socks machine can clean (0-50)
  # c = [1,2,1,1] clean socks (max 50)
  # d = [1,4,3,2,4] dirty socks (max 50)
  # # represents color (1-50)
  sock_pairs_on_trip = 0

  c.sort! # [1,1,1,2]
  d.sort! # [1,2,3,4,4]

  # sort clean, count existing pairs and remove pairs from clean

  clean_pairs = []
  clean_singles = []

  i = 0
  loop do
    break if c[i].nil?

    if c[i] == c[i + 1]
      clean_pairs.append(c[i], c[i + 1])
      sock_pairs_on_trip += 1
      i += 2
    else
      clean_singles.append(c[i])
      i += 1
    end
  end

  # clean_pairs = [1,1]
  # clean_singles = [1,2]
  # sock_pairs_on_trip = 1

  laundry_bag = []
  # add dirty matches to laundry_bag (until full or no more)
  i = 0
  loop do
    break if clean_singles[i].nil?
    break if laundry_bag.count >= k

    index_of_match = d.index(clean_singles[i])
    if index_of_match.nil?
      i += 1
      next
    end

    clean_singles.delete_at(i)
    laundry_bag.append(d[index_of_match])
    d.delete_at(index_of_match)
    sock_pairs_on_trip += 1
    i += 1
  end

  # then add dirty pairs to clean (until full or no more)

  # returns the maximum number of pairs of socks that Bob can take on the trip.
  sock_pairs_on_trip
end

# should return 3
puts solution(2, [1, 2, 1, 1], [1, 4, 3, 2, 4])
