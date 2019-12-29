/*
 * @lc app=leetcode id=92 lang=swift
 *
 * [92] Reverse Linked List II
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
  func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    if head == nil || head?.next == nil || m == n { 
      return head 
    }
    var tempHead = head
    var pre: ListNode? = nil
      
    var start = 1
    // 找到第 m 个结点。
    while start < m {
      pre = tempHead
      tempHead = tempHead?.next
      start += 1
    }
      
    let tempPre = pre
    var left = tempHead
      
    // 翻转链表
    while start <= n {
      let next = left?.next
      left?.next = pre
      pre = left
      left = next
      start += 1
    }
    tempHead?.next = left
      
    // 如果不是从头节点开始翻转，则需要连接翻转处。
    if tempPre != nil {
      tempPre?.next = pre
      return head
    } else {
      return pre
    } 
  }
}
// @lc code=end

