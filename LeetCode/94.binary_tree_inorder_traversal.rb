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
def inorder_traversal(root)
  return [] if root.nil?

  result = []
  inorder_traversal_recursively(root, result)
  result
end

def inorder_traversal_iteratively(root)
  result = []
  stack = []
  node = root
  until stack.empty? && !node.nil?
    if node.nil?
      node = stack.pop
      result << node.val
      node = node.right
    else
      stack << node
      node = node.left
    end
  end
  result
end

def inorder_traversal_recursively(root, result)
  inorder_traversal_recursively(root.left, result) unless root.left.nil?
  result << root.val
  inorder_traversal_recursively(root.right, result) unless root.right.nil?
end
