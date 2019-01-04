class Solution {
	func lengthOfLongestSubstring(_ s: String) -> Int {
		/// 转换为 utf8 数组
		let string = s.utf8CString
		guard !string.isEmpty else { return 0 }
		/// 还是用 dictionary 来进行操作，key 为字符，value 为对应的 index
		/// result 用来记录已遍历到的最大长度
		/// start 表示当前无重复字符串的起始位置
		/// index 表示遍历的当前位置
		/// 这里有个非常奇怪的地方，就是如果 dictionary 指定类型，不使用类型推断反而会比较慢，慢上几 ms
		var dictionary = [CChar: Int](minimumCapacity: Int(Int8.max))
		var start: Int = 0
		var result: Int = 0
		for index in 0..<(string.count - 1) {
			let character = string[index]
			/// 如果当前的 character 对应的 value 不为空，则说明有重复字符
			/// 起始位置则改为从 start 和 重复字符的 index + 1 中选择最大的那个，
			/// 防止 start 出现倒转的情况，如 abba 
			if let last = dictionary[character] {
				start = max(start, last + 1)
			}
			dictionary[character] = index
			result = max(result, index - start + 1)
		}
		return result
	}
}

let solution = Solution()
print(solution.lengthOfLongestSubstring("abba"))