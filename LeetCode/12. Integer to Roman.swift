class Solution {
	func intToRoman(_ num: Int) -> String {
		let romanValues: [(String, Int)] = [
			("M", 1000),
			("CM", 900),
			("D", 500),
			("CD", 400),
			("C", 100),
			("XC", 90),
			("L", 50),
			("XL", 40),
			("X", 10),
			("IX", 9),
			("V", 5),
			("IV", 4),
			("I", 1)
			]
		var roman: String = ""
		var number: Int = num
		for romanValue in romanValues {
			if number / romanValue.1 != 0 {
				let value = number / romanValue.1
				for _ in 0..<value {
					roman.append(romanValue.0)
				}
				number = number % romanValue.1
			}
		}
		return roman
	}
}