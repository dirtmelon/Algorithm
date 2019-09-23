#
# @lc app=leetcode id=222 lang=ruby
#
# [222] Count Complete Tree Nodes
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  return 0 if root.nil?

  left_height = left_height(root)
  right_height = right_height(root)

  return 2**left_height - 1 if left_height == right_height

  1 + count_nodes(root.left) + count_nodes(root.right)
end

def left_height(root)
  return 0 if root.nil?

  1 + left_height(root.left)
end

def right_height(root)
  return 0 if root.nil?

  1 + right_height(root.right)
end
