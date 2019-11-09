#
# @lc app=leetcode id=1123 lang=ruby
#
# [1123] Lowest Common Ancestor of Deepest Leaves
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

# @param {TreeNode} root
# @return {TreeNode}
def lca_deepest_leaves(root)
  find_deepset_leaves(root, 0)[0]
end

def find_deepset_leaves(root, level)
  return [nil, 0] if root.nil?

  (left, left_level) = find_deepset_leaves(root.left, level)
  (right, right_level) = find_deepset_leaves(root.right, level)
  return [root, left_level + 1] if left_level == right_level
  return [left, left_level + 1] if left_level > right_level

  [right, right_level + 1]
end
# @lc code=end
