class Node:
  def __init__(self, value, left=None, right=None) -> None:
    self.value = value if value >= 0 else 0
    self.left = left
    self.right = right

class Tree:
  def __init__(self, root=None) -> None:
    self.root = root

  def sum(self) -> int:
    return Tree.sum(self.root)

  @staticmethod
  def sum(root_node) -> int:
    if (root_node == None):
        return 0
    return (root_node.value + Tree.sum(root_node.left) + Tree.sum(root_node.right))

  @staticmethod
  def insert(arr, i = 0) -> Node | None:
    root = None
    n = len(arr)

    if i < n:
      root = Node(arr[i])
      root.left = Tree.insert(arr, 2 * i + 1)
      root.right = Tree.insert(arr, 2 * i + 2)

    return root


def solution(arr) -> str:
  root = Tree.insert(arr)

  left_sum = Tree.sum(root.left)
  right_sum = Tree.sum(root.right)

  if left_sum > right_sum:
    return 'Left'
  elif right_sum > left_sum:
    return 'Right'
  else:
    return ''


print("👍") if solution([3,6,2,9,-1,10]) == 'Left' else print("😣")
