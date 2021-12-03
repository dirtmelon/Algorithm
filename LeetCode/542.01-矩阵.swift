/*
 * @lc app=leetcode.cn id=542 lang=swift
 *
 * [542] 01 矩阵
 */

// @lc code=start
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var result: [[Int]] = mat
        // 染色
        for row in 0..<mat.count {
            for col in 0..<mat[0].count {
                if mat[row][col] == 1 {
                    result[row][col] = -1
                }
            }
        }
        for row in 0..<mat.count {
            for col in 0..<mat[0].count {
                
                if mat[row][col] != 0 {
                    continue
                }
                var stack: [[Int]] = [[row, col]]
                while !stack.isEmpty {
                    let last = stack.removeLast()
                    if last[0] > 0 && (result[last[0] - 1][last[1]] > result[last[0]][last[1]] + 1 || result[last[0] - 1][last[1]] == -1) {
                        result[last[0] - 1][last[1]] = result[last[0]][last[1]] + 1
                        stack.append([last[0] - 1, last[1]])
                    }
                    if last[0] < mat.count - 1 && (result[last[0] + 1][last[1]] > result[last[0]][last[1]] + 1 || result[last[0] + 1][last[1]] == -1) {
                        result[last[0] + 1][last[1]] = result[last[0]][last[1]] + 1
                        stack.append([last[0] + 1, last[1]])
                    }
                    if last[1] > 0 && (result[last[0]][last[1] - 1] > result[last[0]][last[1]] + 1 || result[last[0]][last[1] - 1] == -1) {
                        result[last[0]][last[1] - 1] = result[last[0]][last[1]] + 1
                        stack.append([last[0], last[1] - 1])
                    }
                    if last[1] < mat[0].count - 1 && (result[last[0]][last[1] + 1] > result[last[0]][last[1]] + 1 || result[last[0]][last[1] + 1] == -1) {
                        result[last[0]][last[1] + 1] = result[last[0]][last[1]] + 1
                        stack.append([last[0], last[1] + 1])
                    }
                }
            }
        }
        return result
    }
}
// @lc code=end

