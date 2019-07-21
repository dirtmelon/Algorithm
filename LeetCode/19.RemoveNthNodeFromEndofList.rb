# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  first = head
  second = head
  distance = 0
  while first != nil
    first = first.next
    if distance < n + 1
      distance += 1
    else
      second = second.next
    end
  end
  if distance == n + 1
    second.next = second.next.next if second.next != nil
  else
    head = head.next
  end
  return head
end
