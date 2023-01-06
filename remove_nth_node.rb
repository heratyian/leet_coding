# 19. Remove Nth Node From End of List
# Medium
# 13.7K
# 567
# Companies
# Given the head of a linked list, remove the nth node from the end of the list and return its head.

 

# Example 1:


# Input: head = [1,2,3,4,5], n = 2
# Output: [1,2,3,5]
# Example 2:

# Input: head = [1], n = 1
# Output: []
# Example 3:

# Input: head = [1,2], n = 1
# Output: [1]

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def remove_nth_node(n)

  end
end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  
end


puts "#{remove_nth_from_end([1,2,3,4,5], 2)} == [1,2,3,5]"
puts "#{remove_nth_from_end([1], 1)} == []"
puts "#{remove_nth_from_end([1, 2], 1)} == []"
