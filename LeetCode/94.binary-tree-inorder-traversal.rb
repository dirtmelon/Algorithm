#
# @lc app=leetcode id=94 lang=ruby
#
# [94] Binary Tree Inorder Traversal
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
# reverse
# def inorder_traversal(root)
#   result = []
#   return [] if root.nil?

#   result += inorder_traversal(root.left)
#   result += [root.val]
#   result += inorder_traversal(root.right)
#   result
# end

# iterate
def inorder_traversal(root)
  return [] if root.nil?

  result = []
  stack = [root]
  cur = root
  while !stack.empty? || !cur.nil?
    if cur.nil?
      cur = stack.pop
      result << cur.val
      cur = cur.right
    else
      stack << cur
      cur = cur.left
    end
  end
  result
end
