class Solution {
	func romanToInt(_ s: String) -> Int {
		let array = Array(s)
		var intValue: Int = 0
		var index: Int = 0
		while index < array.count {
			let character = array[index]
			switch character {
			case "I":
				if index + 1 < array.count {
					if array[index + 1] == "V" {
						intValue += 4
						index += 2
					} else if array[index + 1] == "X" {
						intValue += 9
						index += 2
					} else {
						intValue += 1
						index += 1
					}
				} else {
					intValue += 1
					index += 1
				}
			case "V":
				intValue += 5
				index += 1
			case "X":
				if index + 1 < array.count {
					if array[index + 1] == "L" {
						intValue += 40
						index += 2
					} else if array[index + 1] == "C" {
						intValue += 90
						index += 2
					} else {
						intValue += 10
						index += 1
					}
				} else {
					intValue += 10
					index += 1
				}
			case "L":
				intValue += 50
				index += 1
			case "C":
				if index + 1 < array.count {
					if array[index + 1] == "D" {
						intValue += 400
						index += 2
					} else if array[index + 1] == "M" {
						intValue += 900
						index += 2
					} else {
						intValue += 100
						index += 1
					}
				} else {
					intValue += 100
					index += 1
				}
			case "D":
				intValue += 500
				index += 1
			case "M":
				intValue += 1000
				index += 1
			default:
				index += 1
			}
		}
		return intValue
	}
}