/*
 * @lc app=leetcode id=120 lang=swift
 *
 * [120] Triangle
 */

// @lc code=start
class Solution {
  func minimumTotal(_ triangle: [[Int]]) -> Int {
    let row_count: Int = triangle.count
    let column_count: Int = triangle[row_count - 1].count
    var dp: [Int] = Array(repeating: 0,
                            count: row_count)   
    dp[0] = triangle[0][0]
    
    for row in 1..<row_count {
      
      dp[row] = dp[row - 1] + triangle[row][row]
      for column in stride(from: row - 1, to: 0, by: -1) {
        dp[column] = min(dp[column - 1], dp[column]) + 
          triangle[row][column]
      }
      dp[0] = dp[0] + triangle[row][0]
    }
    return dp.min()!
  }
}
// @lc code=end

