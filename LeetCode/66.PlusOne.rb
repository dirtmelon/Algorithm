# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  next_value = 1
  index = digits.size - 1
  while index >= 0 || next_value != 0
    if index >= 0
      digits[index] += next_value
      if digits[index] == 10
        digits[index] = 0
      else
        return digits
      end
    else
      digits.unshift 1
      return digits
    end
    index -= 1
  end
end
