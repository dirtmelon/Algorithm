# @param {Integer} a
# @param {Integer[]} b
# @return {Integer}
def super_pow(a, b)
  result = 1
  mod = 1337
  pre_base = a % mod
  b.reverse_each { |num|
    cur_result = pow(pre_base, num) % mod
    result = (result * cur_result % mod) % mod
    pre_base = pow(pre_base, 10) % mod
  }
  return result
end

def pow(pre_base, num)
  mod = 1337
  cur_base = pre_base % mod
  res = 1
  while num > 0
    res = (res * cur_base) % mod if num & 1 == 1
    cur_base = cur_base * cur_base % 1337
    num = num >> 1
  end
  return res
end
