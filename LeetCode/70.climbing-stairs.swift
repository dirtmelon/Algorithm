/*
 * @lc app=leetcode id=70 lang=swift
 *
 * [70] Climbing Stairs
 */

// @lc code=start
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

