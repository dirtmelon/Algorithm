/*
 * @lc app=leetcode id=136 lang=swift
 *
 * [136] Single Number
 */

// @lc code=start
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}
// @lc code=end

