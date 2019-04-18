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
//class Solution {
//	func longestPalindrome(_ s: String) -> String {
//		guard s.count >= 2 else { return s }
//		let characters = Array("#" + Array(s).map { String($0)}.joined(separator: "#") + "#")
//		var rl: [Int] = Array(repeating: 0, count: characters.count)
//		var tmpMaxRight = 0
//		var tmpPos = 0
//		var maxRight = 0
//		var pos = 0
//		var maxLen = 0
//		for i in 0..<characters.count {
//			if i < tmpMaxRight {
//				rl[i] = min(rl[2 * tmpPos - i], tmpMaxRight - i)
//			} else {
//				rl[i] = 1
//			}
//			while i - rl[i] >= 0 && i + rl[i] < characters.count && characters[i - rl[i]] == characters[i + rl[i]] {
//				rl[i] += 1
//			}
//			if rl[i] + i - 1 > tmpMaxRight {
//				tmpMaxRight = rl[i] + i - 1
//				tmpPos = i
//			}
//			if maxLen < rl[i] {
//				maxRight = tmpMaxRight
//				pos = tmpPos
//				maxLen = rl[i]
//			}
//		}
//		let start = pos - (maxRight - pos)
//		return String(characters[start..<maxRight]).replacingOccurrences(of: "#", with: "")
//	}
//}