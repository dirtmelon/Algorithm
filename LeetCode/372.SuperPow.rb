# @param {Integer} a
# @param {Integer[]} b
# @return {Integer}
def super_pow(a, b)
  result = 1
  mod = 1337
  pre_base = a % mod
  b.reverse_each { |num|
    cur_result = pre_base ** num % mod
    result = (result * cur_result % mod) % mod
    pre_base = (pre_base ** 10) % mod
  }
  return result
end
