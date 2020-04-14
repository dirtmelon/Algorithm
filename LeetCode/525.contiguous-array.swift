/*
 * @lc app=leetcode id=525 lang=swift
 *
 * [525] Contiguous Array
 */

// @lc code=start
/*
[0,1]
[1,0]
records[count] 表示 index 时 count 为多少，count
*/
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        // key 为 index 和 value 为 count ，初始化为 [0:-1] ，
        // [0, 1] 时，index = 0 , count = -1 , records[-1] = 0
        // index = 1 , count = 0 , result = records[0] = index - (-1) = 1 + 1 = 2
        // 可以看到设为 -1 使得可以包括第一位的长度
        // 如果 records[count] 已有值，则表示 index 到 records[count] 内的子数组 1 和 0 数量相等
        var records: [Int: Int] = [0:-1]
        // 已经获取到的结果
        var result = 0
        // count 表示和，遇到 1 则加 1 ，遇到 0 减 1
        var count = 0
        for index in 0..<nums.count {
            count = count + (nums[index] == 1 ? 1 : -1)
            if let record = records[count] {
                result = max(result, index - record)
            } else {
                records[count] = index
            }            
        }
        return result
    }
}
// [0,1,0,0,1,1,0] , records = [0:-1]
// index = 0 , count = -1 , records = [-1:0, 0:-1], result = 0
// index = 1 , count = 0 , records = [-1:0, 0:-1], result = 2
// index = 2, count = -1, records = [-1:0, 0:-1], result = 2
// index = 3, count = -2, records = [-1:0, 0:-1, -2:3], result = 2
// index = 4, count = -1, records = [-1:0, 0:-1, -2:3], result = 4
// index = 5, count = 0, records = [-1:0, 0:-1, -2:3], result = 6
// index = 6, count = -1, records = [-1:0, 0:-1, -2:3], result = 6
// @lc code=end

