/*
 * @lc app=leetcode id=322 lang=swift
 *
 * [322] Coin Change
 */

// @lc code=start
class Solution {
  func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp: [Int] = Array(repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    for coin in coins {
      for i in 0..<(amount + 1) {
        if (i - coin < 0) {
          continue
        }
        dp[i] = min(dp[i], 1 + dp[i - coin])
      }
    }
    if dp[amount] == amount + 1 {
      return -1
    } else {
      return dp[amount]
    }
  }
}
// @lc code=end

