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
def preorder_traversal(root)
  return [] if root.nil?

  result = []
  stack = []
  stack << root
  until stack.empty?
    last = stack.pop
    result << last.val
    stack << last.right unless last.right.nil?
    stack << last.left unless last.left.nil?
  end
  result
end
