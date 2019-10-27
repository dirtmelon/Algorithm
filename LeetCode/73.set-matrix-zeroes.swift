/*
 * @lc app=leetcode id=73 lang=swift
 *
 * [73] Set Matrix Zeroes
 */

// @lc code=start
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rowCount = matrix.count
        let columnCount = matrix[0].count
        var columnZero: Bool = false
        for row in 0..<rowCount {
            if matrix[row][0] == 0 {
                columnZero = true
            }
            for column in 1..<columnCount {
                if matrix[row][column] == 0 {
                    matrix[row][0] = 0
                    matrix[0][column] = 0
                }
            }
        }
        for row in stride(from: rowCount - 1, through: 0, by: -1) {
            for column in stride(from: columnCount - 1, through: 1, by: -1) {
                if matrix[row][0] == 0 || matrix[0][column] == 0 {
                    matrix[row][column] = 0 
                }
            }
            if columnZero {
                matrix[row][0] = 0
            }
        }
        
    }
}
// @lc code=end

