class Solution {
	func reverse(_ x: Int) -> Int {
		var number = x
		var newNumber: Int = 0
		while number != 0 {
			newNumber *= 10
			let y = number % 10
			newNumber += y
			number = number / 10
		}
		guard newNumber <= Int32.max && newNumber >= Int32.min else {
			return 0
		}
		return newNumber
	}
}