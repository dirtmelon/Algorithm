/*
 * @lc app=leetcode id=202 lang=swift
 *
 * [202] Happy Number
 */

// @lc code=start
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var dictionary: [Int:Bool] = [:]
        var current = n
        while dictionary[current] == nil {
            dictionary[current] = true
            var temp: Int = 0
            while current != 0 {
                temp += (current % 10) * (current % 10)
                current = current / 10
            }
            current = temp
            if current == 1 {
                return true
            }
        }
        return false
    }
}
// @lc code=end

