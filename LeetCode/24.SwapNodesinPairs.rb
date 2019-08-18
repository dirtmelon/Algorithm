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
def swap_pairs(head)
  return head if head == nil || head.next == nil
  result = head.next
  cur_node = head
  pre_cur_node = nil
  while cur_node != nil && cur_node.next != nil
    next_node = cur_node.next
    cur_node.next = next_node.next
    next_node.next = cur_node
    pre_cur_node.next = next_node if pre_cur_node != nil
    pre_cur_node = cur_node
    cur_node = cur_node.next
  end
  return result
end
