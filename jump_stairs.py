from itertools import combinations_with_replacement, permutations

def solution(n):
    combination_count = 0
    for i in range(1, n + 1):
      for j in combinations_with_replacement([1, 2, 3], i):
        if sum(j) == n:
          unique_elements = list(set(j))
          combination_count += len(list(permutations(unique_elements, len(unique_elements))))

    return combination_count


# should be 4
print(solution(3))
