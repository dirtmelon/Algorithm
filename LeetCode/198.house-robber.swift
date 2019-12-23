/*
 * @lc app=leetcode id=198 lang=swift
 *
 * [198] House Robber
 */

// @lc code=start
class Solution {
  func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 {
      return nums[0]
    }
    if nums.count == 2 {
      return max(nums[0], nums[1])
    }
    var dp1: Int = 0
    var dp2: Int = 0
    var dpResult: Int = 0
    for index in stride(from: nums.count - 1, through: 0, by: -1) {
      dpResult = max(dp1, nums[index] + dp2)
      dp2 = dp1
      dp1 = dpResult
    }
    return dpResult
  }
}
// @lc code=end

