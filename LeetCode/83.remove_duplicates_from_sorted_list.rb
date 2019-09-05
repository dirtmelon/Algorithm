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
def delete_duplicates(head)
  node = head
  until node.next.nil? || node.nil?
    if node.val == node.next.val
      node.next = node.next.next
    else
      node = node.next
    end
  end
  head
end
