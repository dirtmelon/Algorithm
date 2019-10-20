#
# @lc app=leetcode id=67 lang=ruby
#
# [67] Add Binary
#

# @lc code=start
# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  result = []
  a_index = a.size - 1
  b_index = b.size - 1
  next_value = 0
  while a_index >= 0 || b_index >= 0
    sum = next_value
    if a_index >= 0
      sum += a[a_index].to_i
      a_index -= 1
    end
    if b_index >= 0
      sum += b[b_index].to_i
      b_index -= 1
    end
    result.unshift((sum % 2))
    next_value = sum / 2
  end
  result.unshift(next_value) if next_value != 0
  result.join.to_s
end
# @lc code=end
