/*
 * @lc app=leetcode id=189 lang=swift
 *
 * [189] Rotate Array
 */

// @lc code=start
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty && k != 0 else { return }
        var step = k % nums.count
        while step > 0 {
            let lastNum = nums[nums.count - 1]
            nums.removeLast()
            nums.insert(lastNum, at: 0)
            step -= 1
        }
    }
}
// @lc code=end

