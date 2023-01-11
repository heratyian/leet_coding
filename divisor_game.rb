# Alice and Bob take turns playing a game, with Alice starting first.

# Initially, there is a number n on the chalkboard. On each player's turn, that player makes a move consisting of:

# Choosing any x with 0 < x < n and n % x == 0.
# Replacing the number n on the chalkboard with n - x.
# Also, if a player cannot make a move, they lose the game.

# Return true if and only if Alice wins the game, assuming both players play optimally.

# Constraints:

# 1 <= n <= 1000


# @param {Integer} n
# @return {Boolean}
def divisor_game(n)
  n.even?
  # return false if n == 1
  # return true if n == 2
  
  # # Choosing any x with 0 < x < n and n % x == 0.


  # # Return true if and only if player1 wins the game, assuming both players play optimally.
  # player_1_wins
end


require 'minitest/autorun'

class DivisorGameTest < Minitest::Test  
  # Example 1:
  # Input: n = 2
  # Output: true
  # Explanation: Alice chooses 1, and Bob has no more moves.
  def test_example1
    assert_equal(true, divisor_game(2))
  end

  # Example 2:
  # Input: n = 3
  # Output: false
  # Explanation: Alice chooses 1, Bob chooses 1, and Alice has no more moves.
  def test_example2
    assert_equal(false, divisor_game(3))
  end
end