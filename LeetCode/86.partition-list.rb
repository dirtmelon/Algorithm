#
# @lc app=leetcode id=86 lang=ruby
#
# [86] Partition List
#
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  return head if head.nil?

  left_node = ListNode.new(0)
  right_node = ListNode.new(0)
  left_head = left_node
  right_head = right_node
  until head.nil?
    if head.val < x
      left_node.next = head
      left_node = head
    else
      right_node.next = head
      right_node = head
    end
    head = head.next
  end
  right_node.next = nil
  left_node.next = right_head.next
  left_head.next
end
