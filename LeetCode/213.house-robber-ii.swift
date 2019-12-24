/*
 * @lc app=leetcode id=213 lang=swift
 *
 * [213] House Robber II
 */

// @lc code=start
class Solution {
  func rob(_ nums: [Int]) -> Int {
    if nums.count == 1 {
      return nums[0]
    }
    return max(dp(nums, nums.count - 1, 1),
               dp(nums, nums.count - 2, 0))
  }
  
  func dp(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
    var dp1: Int = 0
    var dp2: Int = 0
    var dpResult: Int = 0
    for index in stride(from: start, through: end, by: -1) {
      dpResult = max(dp1, nums[index] + dp2)
      dp2 = dp1
      dp1 = dpResult
    }
    return dpResult
  }
}
// @lc code=end

