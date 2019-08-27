# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  return 0 if dividend.zero?

  sign = (dividend.positive? && divisor.negative?) || (dividend.negative? && divisor.positive?) ? -1 : 1
  dividend = dividend.abs
  divisor = divisor.abs
  result = 0
  while dividend >= divisor
    temp_divisor = divisor
    temp_result = 1
    while dividend > (temp_divisor << 1)
      divisor <<= 1
      temp_result <<= 1
    end
    dividend -= temp_divisor
    result += temp_result
  end
  result *= sign
  return -2**31 if result < -2**31
  return 2**31 - 1 if result > 2**31 - 1

  result
end
