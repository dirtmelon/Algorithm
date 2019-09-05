# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  return false if head.nil?
  return true if head.next.nil?

  tail = head
  middle = head

  while !tail.nil? && !tail.next.nil?
    middle = middle.next
    tail = tail.next.next
  end

  second = tail.nil? ? middle : middle.next

  second_next = nil
  second.next, second, second_next = second_next, second.next, second until second.nil?
  second = second_next
  first = head
  until second.nil?
    break if second.val != first.val

    second = second.next
    first = first.next
  end
  second.nil?
end
