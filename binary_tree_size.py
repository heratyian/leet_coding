class Node:
  def __init__(self, value, left=None, right=None):
    self.value = value
    self.left = left
    self.right = right

class Tree:
  def __init__(self, root=None):
    self.root = root

  @staticmethod
  def size(root):
    if root is None:
      return 0

    return root.value + Tree.size(root.left) + Tree.size(root.right)

  @staticmethod
  def insert(arr, i):
    root = None
    n = len(arr)

    if i < n and arr[i] >= 0:
      root = Node(arr[i])
      root.left = Tree.insert(arr, i * 2 + 1)
      root.right = Tree.insert(arr, i * 2 + 2)

    return root


def solution(arr):
    if len(arr) == 0:
      return ''

    root = Tree.insert(arr, 0)

    left_size = Tree.size(root.left)
    right_size = Tree.size(root.right)

    if left_size > right_size:
      return 'Left'
    elif right_size > left_size:
      return 'Right'
    else:
      return ''

