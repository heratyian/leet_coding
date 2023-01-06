# Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

# Example 1:

# Input: root = [1,3,2,5,3,null,9]
# Output: [1,3,9]
# Example 2:

# Input: root = [1,2,3]
# Output: [1,3]

# Constraints:

# The number of nodes in the tree will be in the range [0, 104].
# -231 <= Node.val <= 231 - 1

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}

class Node
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class Tree
  attr_accessor :head

  def initialize(head: nil)
    @head = head
  end

  def self.build_tree(array)
    return if array.empty?

    root = Node.new(array.shift)
    current_level = [root]

    until current_level.empty?
      next_level = []

      current_level.each do |node|
        node.left = Node.new(array.shift) if array.any?
        node.right = Node.new(array.shift) if array.any?
        next_level << node.left if node.left
        next_level << node.right if node.right
      end

      current_level = next_level
    end

    root
  end

  def self.largest_values(root)
    # Initialize a queue with the root node and a Hash to store the maximum value per row
    queue = [[root, 0]]
    max_per_row = {}

    # Perform a BFS traversal
    until queue.empty?
      # Dequeue a node and its depth from the queue
      node, depth = queue.shift

      # Update the maximum value for the current row
      max_per_row[depth] = [max_per_row[depth] || -Float::INFINITY, node.val || 0].max

      # Add the node's children to the queue, if it has any
      queue << [node.left, depth + 1] if node.left
      queue << [node.right, depth + 1] if node.right
    end

    # Return the maximum value per row
    max_per_row.values
  end
end

values = [1, 3, 2, 5, 3, nil, 9]

head = Tree.build_tree(values)
largest_values = Tree.largest_values(head)

puts largest_values
