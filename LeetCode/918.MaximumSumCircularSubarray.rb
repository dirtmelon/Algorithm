# @param {Integer[]} a
# @return {Integer}
def max_subarray_sum_circular(a)
  max_value = a[0]
  cur_max_value = a[0]
  index = 1
  while index < a.size
    cur_max_value = a[index] + [cur_max_value, 0].max
    max_value = [cur_max_value, max_value].max
    index += 1
  end
  right_sums = Array.new a.size, 0
  right_sums[a.size - 1] = a[a.size - 1]
  index = a.size - 2
  while index >= 0
    right_sums[index] = right_sums[index + 1] + a[index]
    index -= 1
  end
  max_right_sums = Array.new a.size, 0
  max_right_sums[a.size - 1] = right_sums[a.size - 1]
  index = a.size - 2
  while index >= 0
    max_right_sums[index] = [max_right_sums[index + 1], right_sums[index]].max
    index -= 1
  end
  index = 0
  left_sum = 0
  while index < a.size - 2
    left_sum += a[index]
    max_value = [max_value, max_right_sums[index + 2] + left_sum].max
    index += 1
  end
  return max_value
end
