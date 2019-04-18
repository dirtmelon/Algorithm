//
// LongestPalindromicSubstring
// Created by postman on 2019/4/18.

class Solution {
	func longestPalindrome(_ s: String) -> String {
		guard s.count >= 2 else { return s }
		let characters = Array(s)
		var start = 0
		var end = 0
		var max = 0
		for i in 0..<s.count {
			var tempStart = i
			var tempEnd = s.count - 1
			var left = tempStart
			var right = tempEnd
			while left < right {
				if characters[left] == characters[right] {
					if right - left > max {
						max = right - left
						tempStart = left
						tempEnd = right
					}
					left += 1
					right -= 1
				} else {
					left = i
					right = tempEnd - 1
					tempStart = left
					tempEnd = right
					max = 0
				}
			}
			if max > end - start {
				start = tempStart
				end = tempEnd
			}
		}
		return String(characters[start...end])
	}
}
/// https://segmentfault.com/a/1190000003914228 Manacher 算法