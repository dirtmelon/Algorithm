class Solution {
	func maxArea(_ height: [Int]) -> Int {
		var maxArea: Int = 0
		var left: Int = 0
		var right: Int = height.count - 1
		while left < right {
			let line: Int
			let width = right - left
			if height[left] < height[right] {
				line = height[left]
				left += 1
			} else {
				line = height[right]
				right -= 1
			}
			let area = line * width
			maxArea = max(area, maxArea)

		}
		return maxArea
	}
}