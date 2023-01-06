# There are n bulbs that are initially off. You first turn on all the bulbs, then you turn off every second bulb.

# On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on). For the ith round, you toggle every i bulb. For the nth round, you only toggle the last bulb.

# Return the number of bulbs that are on after n rounds.

 

# Example 1:


# Input: n = 3
# Output: 1
# Explanation: At first, the three bulbs are [off, off, off].
# After the first round, the three bulbs are [on, on, on].
# After the second round, the three bulbs are [on, off, on].
# After the third round, the three bulbs are [on, off, off]. 
# So you should return 1 because there is only one bulb is on.
# Example 2:

# Input: n = 0
# Output: 0
# Example 3:

# Input: n = 1
# Output: 1
 

# Constraints:

# 0 <= n <= 109

# @param {Integer} n
# @return {Integer}
def bulb_switch(n)
  light_bulbs = [false] * n
  light_bulbs.count.times { |i| light_bulbs[i] = toggle_bulb?(i, n) }
  light_bulbs.reduce(0) { |sum, on| on ? sum + 1 : sum }
end

def toggle_bulb?(bulb_index, round_count)
  toggle_count = 0
  (round_count + 1).times do |round|
    next unless round.positive?

    toggle_count += 1 if ((bulb_index + 1) % round).zero?
  end

  toggle_count.odd?
end

puts bulb_switch(4)
