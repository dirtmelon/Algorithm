/*
 * @lc app=leetcode id=62 lang=swift
 *
 * [62] Unique Paths
 */

// @lc code=start
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 1 && n > 1 else { return 1}
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        for index in 0..<m {
            dp[0][index] = 1
        }
        for index in 0..<n {
            dp[index][0] = 1
        }
        for row in 1..<n {
            for column in 1..<m {
                dp[row][column] = dp[row - 1][column] + dp[row][column - 1]
            }
        }
        return dp[n - 1][m - 1]
    }
}
// @lc code=end

