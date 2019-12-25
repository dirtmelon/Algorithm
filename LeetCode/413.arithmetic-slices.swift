/*
 * @lc app=leetcode id=413 lang=swift
 *
 * [413] Arithmetic Slices
 */

// @lc code=start
class Solution {
  func numberOfArithmeticSlices(_ A: [Int]) -> Int {
    guard A.count > 2 else {
      return 0
    }

    var dp: [Int] = Array(repeating: 0, count: A.count)
    var sum: Int = 0
    for index in 2 ..< A.count {
      guard A[index] - A[index - 1] == A[index - 1] - A[index - 2] else {
        continue
      }
      dp[index] = dp[index - 1] + 1
      sum += dp[index]
    }
    return sum
  }
}

// @lc code=end