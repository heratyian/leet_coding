# You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces.

# You want to collect as much fruit as possible. However, the owner has some strict rules that you must follow:

# You only have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold.
# Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets.
# Once you reach a tree with fruit that cannot fit in your baskets, you must stop.
# Given the integer array fruits, return the maximum number of fruits you can pick.

# Constraints:

# 1 <= fruits.length <= 105
# 0 <= fruits[i] < fruits.length

# @param {Integer[]} fruits
# @return {Integer}
def total_fruit(fruits)
  max = 0
  basket = {}
  left_i = 0
  fruits.each_with_index do |fruit, right_i|
    basket[fruit] = basket.fetch(fruit, 0) + 1

    while basket.length > 2
      basket[fruits[left_i]] -= 1
      basket.delete(fruits[left_i]) if basket[fruits[left_i]].zero?
      left_i += 1
    end

    max = [max, right_i - left_i + 1].max
  end
  max
end

require 'minitest/autorun'

class TotalFruitTest < Minitest::Test
  # Explanation: We can pick from all 3 trees.
  def test_example1
    assert_equal(3, total_fruit([1, 2, 1]))
  end

  # Explanation: We can pick from trees [1,2,2].
  # If we had started at the first tree, we would only pick from trees [0,1].
  def test_example2
    assert_equal(3, total_fruit([0, 1, 2, 2]))
  end

  # Explanation: We can pick from trees [2,3,2,2].
  # If we had started at the first tree, we would only pick from trees [1,2].
  def test_example3
    assert_equal(4, total_fruit([1, 2, 3, 2, 2]))
  end

  def test_example4
    assert_equal(1, total_fruit([0]))
  end

  def test_example5
    assert_equal(1, total_fruit([0]))
  end

  def test_example6
    assert_equal(6, total_fruit([3, 3, 3, 3, 3, 3]))
  end

  def test_example7
    assert_equal(5, total_fruit([1, 9, 1, 8, 22, 0, 22, 19, 19, 2, 19, 6, 6, 19, 2, 20, 2, 9, 9, 9, 9, 16, 19, 16, 19, 11, 19, 0, 19, 19]))
  end
end
