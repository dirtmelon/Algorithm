/*
 * @lc app=leetcode id=49 lang=swift
 *
 * [49] Group Anagrams
 */

// @lc code=start
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        return Array(Dictionary(grouping: strs, 
                                      by: { String($0.sorted())}).values)
    }
}
// @lc code=end

