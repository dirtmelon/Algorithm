/*
 * @lc app=leetcode id=27 lang=swift
 *
 * [27] Remove Element
 */

// @lc code=start
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        while leftIndex <= rightIndex {
            if nums[leftIndex] == val {
                if nums[rightIndex] != val {
                    nums.swapAt(leftIndex, rightIndex)
                    leftIndex += 1
                    rightIndex -= 1
                } else {
                    rightIndex -= 1
                }
            } else {
                leftIndex += 1
            }
        }
        return leftIndex
    }
}
// @lc code=end

