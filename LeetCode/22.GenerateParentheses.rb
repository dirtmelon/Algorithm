# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  return recurse_parenthesis(n, 0, 0, "", [])
end

def recurse_parenthesis(n, left, right, parentheses, parenthesis)
  parenthesis << parentheses if left + right == 2 * n
  recurse_parenthesis(n, left + 1, right, parentheses + "(", parenthesis) if left < n
  recurse_parenthesis(n, left, right + 1, parentheses + ")", parenthesis) if right < left
  return parenthesis
end

p generate_parenthesis(3)
