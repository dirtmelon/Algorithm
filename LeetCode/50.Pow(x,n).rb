# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return pow(x, n)
end

def pow(pre_base, n)
  cur_base = pre_base

  if n < 0
    cur_base = 1/cur_base
    n = -n
  end
  res = 1
  while n > 0
    res = cur_base * res if n & 1 == 1
    cur_base = cur_base * cur_base
    n = n >> 1
  end
  return res
end
