/*
 * @lc app=leetcode id=122 lang=swift
 *
 * [122] Best Time to Buy and Sell Stock II
 */

// @lc code=start
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var result: Int = 0
        for index in 1..<prices.count {
            if prices[index] > prices[index - 1] {
                result += prices[index] - prices[index - 1]
            }
        }
        return result
    }
}
// @lc code=end

