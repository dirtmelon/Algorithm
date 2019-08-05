# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(s, t)
  return false if (s == nil && t != nil) || (s != nil && t == nil)
  return true if s.val == t.val && is_same_tree(s.left, t.left) && is_same_tree(s.right, t.right) 
  return true if is_subtree(s.left, t) 
  return is_subtree(s.right, t)
end

def is_same_tree(tree1, tree2)
  return true if tree1 == nil && tree2 == nil
  return false if (tree1 == nil && tree2 != nil) || (tree1 != nil && tree2 == nil)
  return tree1.val == tree2.val && is_same_tree(tree1.left, tree2.left) && is_same_tree(tree1.right, tree2.right)
end