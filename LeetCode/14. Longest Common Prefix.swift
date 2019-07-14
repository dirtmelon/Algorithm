class Solution {
	func longestCommonPrefix(_ strs: [String]) -> String {
		guard !strs.isEmpty else { return ""}
		var commonPrefix: String = strs[0]
		for str in strs[1..<strs.count] {
			while !str.hasPrefix(commonPrefix) {
				guard commonPrefix.count - 1 > 0 else {
					return ""
				}
				commonPrefix = String(commonPrefix.prefix(commonPrefix.count - 1))
			}
		}
		return commonPrefix
	}
}