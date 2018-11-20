/// 自己写的，O(n*n)
//class Solution {
//	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//		for i in 0..<(nums.count - 1) {
//			for j in (i + 1)..<nums.count {
//				if nums[i] + nums[j] == target {
//					return [i, j]
//				}
//			}
//		}
//		return []
//	}
//}
// https://leetcode.com/problems/two-sum/discuss/3/Accepted-Java-O(n)-Solution
// 参照一下写了个 Swift 版本，空间换时间典型方案，用 dictionary 来进行优化，dictionary 的 keys.contains 和 
// 获取对应的值消耗时间的都是常数级的
class Solution {
	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		var dictionary: [Int: Int] = [:]
		for i in 0..<nums.count {
			if dictionary.keys.contains(target - nums[i]) {
				return [dictionary[target - nums[i]]!, i]
			}
			dictionary[nums[i]] = i
		}
		return []
	}
}