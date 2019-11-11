#
# @lc app=leetcode id=91 lang=ruby
#
# [91] Decode Ways
#

# @lc code=start
# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.empty? || s[0].to_i.zero?
  return 1 if s.size == 1

  dp = Array.new(s.size, 0)
  dp[0] = 1
  dp[1] += 1 if s[1].to_i != 0
  dp[1] += 1 if s[0..1].to_i <= 26 && s[0..1].to_i > 9
  (2...s.size).each do |index|
    dp[index] = dp[index - 1] if s[index].to_i != 0
    value = s[(index - 1)..index].to_i
    dp[index] += dp[index - 2] if value > 9 && value <= 26
  end
  dp.last
end
# @lc code=end
