/*
 * @lc app=leetcode id=64 lang=swift
 *
 * [64] Minimum Path Sum
 */

// @lc code=start
class Solution {
  func minPathSum(_ grid: [[Int]]) -> Int {
    var results: [[Int]] = Array(repeating: Array(repeating: 0, count: grid[0].count),
                                 count: grid.count)
    results[0][0] = grid[0][0]
    
    for index in 1..<grid[0].count {
      results[0][index] = results[0][index - 1] + grid[0][index]
    }
    
    for index in 1..<grid.count {
      results[index][0] = results[index - 1][0] + grid[index][0]
    }
    
    for row in 1..<grid.count {
      for column in 1..<grid[0].count {
        let left = results[row][column - 1]
        let top = results[row - 1][column]
        results[row][column] = (left > top ? top : left) + grid[row][column]
      }
    }
    
    return results[grid.count - 1][grid[0].count - 1]
  }
}
// @lc code=end

