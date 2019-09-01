# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  return false if num.zero?
  return true if num == 1

  [2, 3, 5].each do |value|
    num /= value while (num % value).zero?
  end
  num == 1
end

p is_ugly 14
