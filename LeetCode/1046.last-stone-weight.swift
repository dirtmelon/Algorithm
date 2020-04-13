/*
 * @lc app=leetcode id=1046 lang=swift
 *
 * [1046] Last Stone Weight
 */

// @lc code=start
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sortedStones: [Int] = stones.sorted()
        while sortedStones.count > 1 {
            sortedStones[sortedStones.count - 2] = sortedStones[sortedStones.count - 1] -   sortedStones[sortedStones.count - 2]
            sortedStones.removeLast()
            let stone = sortedStones.last!

            for index in 0..<sortedStones.count {
                if stone <= sortedStones[index] {
                    sortedStones.removeLast()
                    sortedStones.insert(stone, at:index)
                    break
                }
            }
        }
        return sortedStones[0]
    }
}
// @lc code=end

