/*
 * @lc app=leetcode id=283 lang=swift
 *
 * [283] Move Zeroes
 */

// @lc code=start
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var nonZeroIndex: Int = 0
        for index in 0..<nums.count {
            if nums[index] != 0 {
                let temp = nums[nonZeroIndex]
                nums[nonZeroIndex] = nums[index]
                nums[index] = temp
                nonZeroIndex += 1
            }
        }
    }
}
// @lc code=end

