class Node:
  def __init__(self, value, left=None, right=None):
    self.value = value
    self.left = left
    self.right = right

class Tree:
  def __init__(self, root=None):
    self.root = root

  def max_height(self):
    return Tree.height(self.root)

  @staticmethod
  def height(node):
    if node == None or node.value == -1:
      return 0
    else:
      left_height = Tree.height(node.left)
      right_height = Tree.height(node.right)

      if left_height > right_height:
        return left_height + 1
      else:
        return right_height + 1

  @staticmethod
  def insert(arr, i = 0):
    root = None
    n = len(arr)

    if i < n:
      root = Node(arr[i])
      root.left = Tree.insert(arr, i * 2 + 1)
      root.right = Tree.insert(arr, i * 2 + 2)

    return root

def solution(arr):
    root = Tree.insert(arr, 0)
    t = Tree(root)

    return t.max_height()


print(solution([1, 2, 3, 4, -1, -1, -1]))