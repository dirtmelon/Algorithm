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
def middle_node(head)
  return nil if head.nil?

  slow = head
  fast = head

  while !fast.nil? && !fast.next.nil?
    slow = slow.next
    fast = fast.next.next
  end
  slow
end
