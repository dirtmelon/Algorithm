class Solution {
	func isMatch(_ s: String, _ p: String) -> Bool {
		let sArray = Array(s)
		let pArray = Array(p)
		let sCount = sArray.count
		let pCount = pArray.count
		var isMatch = [[Bool]](repeating: [Bool](repeating: false, count: sCount + 1),
							   count: pCount + 1)
		isMatch[0][0] = true
		for j in stride(from: 2, to: pCount + 1, by: 2) {
			if pArray[j - 1] == "*" {
				isMatch[j][0] = isMatch[j - 2][0]
			}
		}
		guard sCount > 0, pCount > 0 else {
			return isMatch[pCount][sCount]
		}
		for row in 1...pCount {
			for col in 1...sCount {
				let currentP = pArray[row - 1]
				let currentS = sArray[col - 1]
				let canRepeat = currentP == "*"
				let isPoint = currentP == "."
				if canRepeat {
					let preChar = pArray[row - 2]
					if isMatch[row - 2][col] {
						isMatch[row][col] = true
					} else if preChar == currentS || preChar == "." {
						let matchAsSingle = isMatch[row - 1][col]
						let matchAsMultiple = isMatch[row][col - 1]
						isMatch[row][col] = matchAsSingle || matchAsMultiple
					}
				} else if isPoint || currentP == currentS {
					isMatch[row][col] = isMatch[row - 1][col - 1]
				}
			}
		}
		return isMatch[pCount][sCount]
	}
}
