#
# @lc app=leetcode id=144 lang=ruby
#
# [144] Binary Tree Preorder Traversal
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
# @return {Integer[]}
# recursive
def preorder_traversal(root)
  return [] if root.nil?

  result = [root.val]
  result += preorder_traversal(root.left)
  result += preorder_traversal(root.right)
  result
end

# iterative
def preorder_traversal(root)
  return [] if root.nil?

  result = []
  stack = [root]
  until stack.empty?
    cur = stack.pop
    result << cur.val
    stack << cur.right unless cur.right.nil?
    stack << cur.left unless cur.left.nil?
  end
  result
end
