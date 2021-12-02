/*
 * @lc app=leetcode.cn id=116 lang=swift
 *
 * [116] 填充每个节点的下一个右侧节点指针
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        connect(root, nil)
        return root
    }

    func connect(_ root: Node?, _ prev: Node?) {
        guard let root = root else { return }
        prev?.next = root
        connect(root.left, prev?.right)
        connect(root.right, root.left)
    }
}
// @lc code=end

