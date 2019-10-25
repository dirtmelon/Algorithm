/*
 * @lc app=leetcode id=62 lang=swift
 *
 * [62] Unique Paths
 */

// @lc code=start
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 1, count: m)
        
        for row in 1..<n {
            for column in 1..<m {
                dp[column] += dp[column - 1]
            }
        }
        return dp[m - 1]
    }
}
// @lc code=end

