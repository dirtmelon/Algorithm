# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return nil if head.nil?

  reverse_list_iteratively(head)
end

def reverse_list_recursively(current_node, next_node)
  pre_next = current_node.next
  current_node.next = next_node
  return current_node if pre_next.nil?

  reverse_list_recursively(pre_next, current_node)
end

def reverse_list_iteratively(head)
  current_node = head
  next_node = nil
  until current_node.nil?
    temp = current_node.next
    current_node.next = next_node
    next_node = current_node
    current_node = temp
  end
  next_node
end
