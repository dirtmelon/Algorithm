#
# @lc app=leetcode id=61 lang=ruby
#
# [61] Rotate List
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
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if head.nil? || head.next.nil? || k.zero?

  length = 1
  tail_node = head
  until tail_node.next.nil?
    length += 1
    tail_node = tail_node.next
  end
  return head if (k % length).zero?

  cur_node = head
  step = 1
  while step < (length - k % length)
    cur_node = cur_node.next
    step += 1
  end
  cur_head = cur_node.next
  tail_node.next = head
  cur_node.next = nil
  cur_head
end
