#
# @lc app=leetcode id=105 lang=ruby
#
# [105] Construct Binary Tree from Preorder and Inorder Traversal
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if preorder.empty? || inorder.empty?

  root = TreeNode.new(preorder.first)
  index = inorder.find_index(preorder.first)
  preorder.shift
  root.left = build_tree(preorder, inorder[0...index]) unless index.zero?
  root.right = build_tree(preorder, inorder[(index + 1)...inorder.size]) unless index == inorder.size - 1
  root
end
