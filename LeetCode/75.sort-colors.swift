/*
 * @lc app=leetcode id=75 lang=swift
 *
 * [75] Sort Colors
 */

// @lc code=start
class Solution {
    func sortColors(_ nums: inout [Int]) {
        var leftIndex: Int = 0
        var rightIndex: Int = nums.count - 1
        var index = 0
        while index <= rightIndex {
            while nums[index] == 2 && index < rightIndex {
                nums.swapAt(index, rightIndex)
                rightIndex -= 1
            }
            while nums[index] == 0 && index > leftIndex {
                nums.swapAt(index, leftIndex)
                leftIndex += 1
            }
            index += 1
        }
    }
}
// [2,0,2,1,1,0]
// [0,0,2,1,1,2]
// 

// @lc code=end

