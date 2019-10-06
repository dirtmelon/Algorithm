#
# @lc app=leetcode id=191 lang=ruby
#
# [191] Number of 1 Bits
#

# @lc code=start
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  result = 0
  while n != 0
    result += 1
    n = (n - 1) & n
  end
  result
end
# @lc code=end
