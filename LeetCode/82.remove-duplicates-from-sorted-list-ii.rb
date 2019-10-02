#
# @lc app=leetcode id=82 lang=ruby
#
# [82] Remove Duplicates from Sorted List II
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
# @return {ListNode}
def delete_duplicates(head)
  return head if head.nil? || head.next.nil?

  result = ListNode.new(0)
  result.next = head
  cur_node = head
  pre_node = result
  until cur_node.nil?
    cur_node = cur_node.next while !cur_node.next.nil? && cur_node.next.val == cur_node.val
    if pre_node.next == cur_node
      pre_node = pre_node.next
    else
      pre_node.next = cur_node.next
    end
    cur_node = cur_node.next
  end
  result.next
end
