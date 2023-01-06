class Node
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    self.value = [value, 0].max
    self.left = left
    self.right = right
  end
end

class Tree
  def initialize(head = nil)
    @head = head
  end

  def self.insert(arr, i)
    root = nil
    n = arr.count

    if i < n
      root = Node.new(arr[i])
      root.left = Tree.insert(arr, i * 2 + 1)
      root.right = Tree.insert(arr, i * 2 + 2)
    end

    root
  end

  def self.sum(head)
    return 0 if head.nil?

    head.value + Tree.sum(head.left) + Tree.sum(head.right)
  end

  def sum
    Tree.sum(head)
  end
end

def solution(arr)
  return '' if arr.count.zero?

  root = Tree.insert(arr, 0)

  left_sum = Tree.sum(root.left)
  right_sum = Tree.sum(root.right)

  return 'Right' if right_sum > left_sum
  return 'Left' if left_sum > right_sum

  ''
end


# puts solution([3,6,2,9,-1,10])
puts solution []
