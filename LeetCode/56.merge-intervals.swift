/*
 * @lc app=leetcode id=56 lang=swift
 *
 * [56] Merge Intervals
 */

// @lc code=start
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        let sortedIntervals = intervals.sorted { $0[0] < $1[0]}
        var result: [[Int]] = [sortedIntervals[0]]
        for index in 1..<sortedIntervals.count {
            var last = result[result.count - 1]
            // last 结束时间大于当前区间的开始时间时表示两者可以合并
            if last[1] >= sortedIntervals[index][0] {
              // 当前区间的结束时间大于 last 的结束时间时表示可以更新结束时间
                if sortedIntervals[index][1] > last[1] {
                    last[1] = sortedIntervals[index][1]
                    result[result.count - 1] = last
                }
            } else {
                result.append(sortedIntervals[index])
            }
        }
        return result
    }
}
// @lc code=end

