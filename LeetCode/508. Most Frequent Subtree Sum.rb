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
def find_frequent_tree_sum(root)
  hash = Hash.new(0)
  sum = bfs_tree_sum(root, hash)
  max_value = hash.values.max_value
  return hash.select { |key, value| value == max_value}.keys
end

def bfs_tree_sum(root, hash)
  sum = root.val
  if root.left != nil
    sum += bfs_tree_sum(root.left, hash, sum)
  end
  if root.right != nil
    sum += bfs_tree_sum(root.right, hash, sum)
  end
  if hash[sum] == nil
    hash[sum] = 0
  end
  hash[sum] += 1
  return sum
end
