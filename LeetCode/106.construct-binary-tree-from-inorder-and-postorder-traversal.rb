#
# @lc app=leetcode id=106 lang=ruby
#
# [106] Construct Binary Tree from Inorder and Postorder Traversal
#

# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  return nil if inorder.empty?

  root = TreeNode.new(postorder.pop)
  index = inorder.find_index(root.val)
  root.right = build_tree(inorder[(index + 1)...inorder.size], postorder)
  root.left = build_tree(inorder[0...index], postorder)
  root
end
# @lc code=end
