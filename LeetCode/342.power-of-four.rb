#
# @lc app=leetcode id=342 lang=ruby
#
# [342] Power of Four
#

# @lc code=start
# @param {Integer} num
# @return {Boolean}
def is_power_of_four(num)
  return false if num.negative?
  return false if num & num - 1 != 0

  num & 0x55555555 != 0
end
# @lc code=end
