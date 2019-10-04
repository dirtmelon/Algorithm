#
# @lc app=leetcode id=145 lang=ruby
#
# [145] Binary Tree Postorder Traversal
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
#  recursive
def postorder_traversal(root)
  return [] if root.nil?

  result = []
  result += postorder_traversal(root.left)
  result += postorder_traversal(root.right)
  result << root.val
  result
end

# iterative
def postorder_traversal(root)
  return [] if root.nil?

  result = []
  stack = []
  cur = root
  while !stack.empty? || !cur.nil?
    if cur.nil?
      cur = stack.pop.left
    else
      stack << cur
      result.unshift(cur.val)
      cur = cur.right
    end
  end
  result
end
