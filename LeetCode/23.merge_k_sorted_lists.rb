# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  return nil if lists.empty?

  return lists[0] if lists.size == 1

  return merge_two_lists(lists[0], lists[1]) if lists.size == 2

  low = 0
  high = lists.size - 1

  mid = low + (high - low) / 2
  merge_two_lists(merge_k_lists(lists[0..mid]),
                  merge_k_lists(lists[(mid + 1)..high]))
end

def merge_two_lists(l1, l2)
  return l1 unless l2

  return l2 unless l1

  temp = ListNode.new(0)
  current = temp
  while !l1.nil? && !l2.nil?
    if l1.val < l2.val
      current.next = l1
      l1 = l1.next
    else
      current.next = l2
      l2 = l2.next
    end
    current = current.next
  end

  if !l1.nil?
    current.next = l1
  elsif !l2.nil?
    current.next = l2
  end
  temp.next
end
