# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def to_s
    val.to_s
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(val)
    node = ListNode.new(val, nil)
    if @head
      find_tail.next = node
    else
      @head = node
    end
  end

  def find_tail
    node = @head

    loop do
      return node if node.next.nil?

      node = node.next
    end
  end

  def to_a
    a = []
    node = @head
    a.append node.val
    while (node = node.next)
      a.append node.val
    end

    a
  end

  def to_i
    to_a.reverse.join('').to_i
  end

  def to_s
    to_a.to_s
  end
end

class Integer
  def to_a
    to_s.split('').map(&:to_i)
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  ll1 = LinkedList.new(l1)
  ll2 = LinkedList.new(l2)
  sum = ll1.to_i + ll2.to_i

  sum_ll = LinkedList.new
  sum.to_a.reverse.each { |num| sum_ll.append(num) }

  sum_ll
end

# binding.irb
# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.
a1 = [2,4,3]
l1 = LinkedList.new
a1.each { |val| l1.append(val) }

a2 = [5,6,4]
l2 = LinkedList.new
a2.each { |val| l2.append(val) }

puts add_two_numbers(l1.head, l2.head)

