# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return 0 if x.zero?

  low = 0
  high = x
  while low <= high
    mid = low + (high - low) / 2
    sqr = mid * mid
    return mid if sqr == x

    if sqr > x
      high = mid - 1
    else
      low = mid + 1
    end
  end
  high
end

p my_sqrt 9
