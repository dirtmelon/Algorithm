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

# 递归
def merge_two_lists(l1, l2)
  return l1 unless l2
  return l2 unless l1

  l1, l2 = l2, l1 if l1.val > l2.val
  l1.next = merge_two_lists(l1.next, l2)
  l1
end

# # 迭代
# def merge_two_lists(l1,l2)
#   return l1 unless l2

#   return l2 unless l1

#   temp = ListNode.new(0)
#   current = temp
#   while !l1.nil? && !l2.nil?
#     if l1.val < l2.val
#       current.next = l1
#       l1 = l1.next
#     else
#       current.next = l2
#       l2 = l2.next
#     end
#     current = current.next
#   end

#   if !l1.nil?
#     current.next = l1
#   elsif !l2.nil?
#     current.next = l2
#   end
#   temp.next
# end
