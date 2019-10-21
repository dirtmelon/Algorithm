/*
 * @lc app=leetcode id=744 lang=swift
 *
 * [744] Find Smallest Letter Greater Than Target
 */

// @lc code=start
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var low: Int = 0
        var high: Int = letters.count
        while low < high {
            let mid = low + (high - low) / 2
            if letters[mid] <= target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        if low == letters.count {
            return letters[0] 
        }
        return letters[low]
    }
}
// @lc code=end

