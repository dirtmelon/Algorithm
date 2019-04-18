//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
//You may assume nums1 and nums2 cannot be both empty.
//
//Example 1:
//
//nums1 = [1, 3]
//nums2 = [2]
//
//The median is 2.0
//Example 2:
//
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//The median is (2 + 3)/2 = 2.5
// 注释掉的是我一开始写的方法，复杂度为 O(m+n)
// LeetCode 上提供了一个 O(log (m+n))，我参考了下，写了一个 Swift 版本的，LeetCode 上的还写了解决思路和说明，值得一看。
// https://leetcode.com/articles/median-of-two-sorted-arrays/

class Solution {
	func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//		var i: Int = 0
//		var j: Int = 0
//		let totalCount = nums2.count + nums1.count
//		var totalNums: [Int] = []
//		let firstIndex: Int
//		let secondIndex: Int
//		if totalCount % 2 == 0 {
//			firstIndex = totalCount / 2 - 1
//		} else {
//			firstIndex = totalCount / 2
//		}
//		secondIndex = totalCount / 2
//		while i < nums1.count && j < nums2.count {
//			if nums1[i] < nums2[j] {
//				totalNums.append(nums1[i])
//				i += 1
//			} else if nums1[i] > nums2[j] {
//				totalNums.append(nums2[j])
//				j += 1
//			} else {
//				totalNums.append(nums1[i])
//				totalNums.append(nums2[j])
//				i += 1
//				j += 1
//			}
//			if totalNums.count > secondIndex {
//				return Double(totalNums[firstIndex] + totalNums[secondIndex]) / Double(2)
//			}
//		}
		let maxNums: [Int]
		let minNums: [Int]
		if nums1.count > nums2.count {
			maxNums = nums1
			minNums = nums2
		} else {
			maxNums = nums2
			minNums = nums1
		}
		var iMin: Int = 0
		var iMax: Int = minNums.count
		let halfLength = (maxNums.count + minNums.count + 1) / 2
		while iMin <= iMax {
			let i = (iMin + iMax) / 2
			let j = halfLength - i
			if i < iMax && minNums[i] < maxNums[j - 1] {
				iMin = i + 1
			} else if i > iMin && minNums[i - 1] > maxNums[j] {
				iMax = i - 1
			} else {
				var maxLeft: Int
				if i == 0 { 
					maxLeft = maxNums[j - 1]
				} else if j == 0 {
					maxLeft = minNums[i - 1]
				} else {
					maxLeft = minNums[i - 1] > maxNums[j - 1] ? minNums[i - 1] : maxNums[j - 1]
				}
				if (maxNums.count + minNums.count) % 2 == 1 {
					return Double(maxLeft)
				}
				
				var minRight: Int
				if i == minNums.count {
					minRight = maxNums[j]
				} else if j == maxNums.count {
					minRight = minNums[i]
				} else {
					minRight = maxNums[j] > minNums[i] ? minNums[i] : maxNums[j]
				}
				return Double(maxLeft + minRight) / 2.0
				
			}
		}
		return 0.0
	}
}

let solution = Solution()
let nums1: [Int] = [3, 4]
let nums2: [Int] = [1, 2]

print(solution.findMedianSortedArrays(nums1, nums2))