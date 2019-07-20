# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.size == 0
  number_characters = { "2" => ["a", "b", "c"],
                        "3" => ["d", "e", "f"],
                        "4" => ["g", "h", "i"],
                        "5" => ["j", "k", "l"],
                        "6" => ["m", "n", "o"],
                        "7" => ["p", "q", "r", "s"],
                        "8" => ["t", "u", "v"],
                        "9" => ["w", "x", "y", "z"]}
  if digits.size == 1
    return number_characters[digits[0]]
  else
    results = []
    suffix_combinations = letter_combinations(digits[1, digits.size - 1])
    current_charactes = number_characters[digits[0]]
    current_charactes.each { |chr|
      suffix_combinations.each do |suffix_combination|
        results << chr + suffix_combination
      end
    }
    return results
  end
end
letter_combinations("23")
