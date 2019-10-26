/*
 * @lc app=leetcode id=70 lang=swift
 *
 * [70] Climbing Stairs
 */

// @lc code=start
// dp[0] = 0
// dp[1] = 1
// dp[2] = dp[2-1] + dp[2-2]
// dp[3] = dp[3-1] + dp[3-2] = 2 + 1
class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var dp: [Int] = Array(repeating: 1, count: n + 1)
        for index in 2...n {
            dp[index] = dp[index - 1] + dp[index - 2]
        }
        return dp[n]
    }
}
// @lc code=end

