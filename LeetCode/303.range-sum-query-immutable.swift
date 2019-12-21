/*
 * @lc app=leetcode id=303 lang=swift
 *
 * [303] Range Sum Query - Immutable
 */

// @lc code=start

class NumArray {
  
  private var sums: [Int]
  init(_ nums: [Int]) {
    self.sums = Array(repeating: 0, count: nums.count + 1)
    for index in 0..<nums.count {
      sums[index + 1] = sums[index] + nums[index]
    }
  }
    
  func sumRange(_ i: Int, _ j: Int) -> Int {
    return sums[j + 1] - sums[i]
  }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(i, j)
 */
// @lc code=end

