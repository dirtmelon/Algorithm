/*
 * @lc app=leetcode id=337 lang=swift
 *
 * [337] House Robber III
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
  func rob(_ root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    let result = maxVal(root)
    return max(result[0], result[1])
  }

  func maxVal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return [0, 0]
    }
    let left = maxVal(root.left)
    let right = maxVal(root.right)
    let robRoot = root.val + left[1] + right[1]
    let notRobRoot = max(left[0], left[1]) + max(right[0], right[1])
    return [robRoot, notRobRoot]
  }
}

// @lc code=end