# A valid parentheses string is either empty "", "(" + A + ")", or A + B, where A and B are valid parentheses strings, and + represents string concatenation.

# For example, "", "()", "(())()", and "(()(()))" are all valid parentheses strings.
# A valid parentheses string s is primitive if it is nonempty, and there does not exist a way to split it into s = A + B, with A and B nonempty valid parentheses strings.

# Given a valid parentheses string s, consider its primitive decomposition: s = P1 + P2 + ... + Pk, where Pi are primitive valid parentheses strings.

# Return s after removing the outermost parentheses of every primitive string in the primitive decomposition of s.

# Constraints:

# 1 <= s.length <= 105
# s[i] is either '(' or ')'.
# s is a valid parentheses string.

# @param {String} s
# @return {String}
def remove_outer_parentheses(s)
  output = ''
  paren_stack = 0
  s.split('').each do |char|
    case char
    when ')'
      paren_stack -= 1
      output << char unless paren_stack.zero?
    when '('
      output << char unless paren_stack.zero?
      paren_stack += 1
    else
      output << char
    end
  end
  output
end

require 'minitest/autorun'

class RemoveOuterParenthesesTest < Minitest::Test
  # Explanation:
  # The input string is "(()())(())", with primitive decomposition "(()())" + "(())".
  # After removing outer parentheses of each part, this is "()()" + "()" = "()()()".
  def test_example1
    assert_equal('()()()', remove_outer_parentheses('(()())(())'))
  end

  # Explanation:
  # The input string is "(()())(())(()(()))", with primitive decomposition "(()())" + "(())" + "(()(()))".
  # After removing outer parentheses of each part, this is "()()" + "()" + "()(())" = "()()()()(())".
  def test_example2
    assert_equal('()()()()(())', remove_outer_parentheses('(()())(())(()(()))'))
  end

  # Explanation:
  # The input string is "()()", with primitive decomposition "()" + "()".
  # After removing outer parentheses of each part, this is "" + "" = "".
  def test_example3
    assert_equal('', remove_outer_parentheses('()()'))
  end
end
