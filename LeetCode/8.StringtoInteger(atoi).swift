class Solution {
    func myAtoi(_ str: String) -> Int {
        var newStr = str.trimmingCharacters(in: .whitespaces)
        guard !newStr.isEmpty else { return 0 }
        var number: Double = 0
        var isNegative: Bool = false

        guard let first = newStr.first else { return 0 }
        if first == "+" || first == "-" {
            newStr.removeFirst()
            if first == "-" {
                isNegative = true
            }
        }
        outerLoop: for character in newStr {
            if number > Double(Int32.max) {
                break outerLoop
            }
            switch character {
            case "1":
                number = number * 10 + 1
            case "2":
                number = number * 10 + 2
            case "3":
                number = number * 10 + 3
            case "4":
                number = number * 10 + 4
            case "5":
                number = number * 10 + 5
            case "6":
                number = number * 10 + 6
            case "7":
                number = number * 10 + 7
            case "8":
                number = number * 10 + 8
            case "9":
                number = number * 10 + 9
            case "0":
                number = number * 10
            default:
                break outerLoop
            }
        }
        if isNegative {
            number = -number
        }
        if number > Double(Int32.max) {
            number = Double(Int32.max)
        } else if number < Double(Int32.min) {
            number = Double(Int32.min)
        }
        return Int(number)
    }
}
