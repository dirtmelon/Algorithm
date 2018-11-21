//
// 2.AddTwoNumbers
// Created by postman on 2018/11/20.
// https://leetcode.com/problems/add-two-numbers/

class ListNode {
	var val: Int
	var next: ListNode?

	init(_ val: Int) {
		self.val = val
		self.next = nil
	}
}

class Solution {
	
	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		guard let l1 = l1, let l2 = l2 else { return nil }
		var tempL1 = l1
		var tempL2 = l2
		var tempValueL1 = tempL1.val
		var tempValueL2 = tempL2.val
		var firstListNode: ListNode? = nil
		var lastListNode: ListNode? = nil
		var next: Int = 0
		while true {
			var value = tempValueL1 + tempValueL2 + next
			if value >= 10 {
				next = 1
				value -= 10
			} else {
				next = 0
			}
			if firstListNode == nil {
				firstListNode = ListNode(value)
				lastListNode = firstListNode
			} else {
				let newLastListNode: ListNode? = ListNode(value)
				lastListNode?.next = newLastListNode
				lastListNode = newLastListNode
			}
			if tempL1.next == nil && tempL2.next == nil {
				break
			}
			if tempL1.next != nil {
				tempL1 = tempL1.next!
				tempValueL1 = tempL1.val
			} else {
				tempValueL1 = 0
			}
			if tempL2.next != nil {
				tempL2 = tempL2.next!
				tempValueL2 = tempL2.val
			} else {
				tempValueL2 = 0
			}
		}
		if next != 0 {
			let newLastListNode = ListNode(next)
			lastListNode?.next = newLastListNode
			lastListNode = newLastListNode
		}
		return firstListNode
	}
}