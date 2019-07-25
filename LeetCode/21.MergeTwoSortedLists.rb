# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  head
  if l1 == nil
    return l1
  elsif l2 == nil
    return l2
  end
  if l1.val > l2.val
    head = l2
    l2 = l2.next
  else
    head = l1
    l1 = l1.next
  end
  tail = head
  while l1 != nil and l2 != nil
    if l1.val > l2.val
      tail.next = l2
      l2 = l2.next
    else
      tail.next = l1
      l1 = l1.next
    end
    tail = tail.next
  end
  if l1 != nil
    tail.next = l1
  else
    tail.next = l2
  end
  return head
end
