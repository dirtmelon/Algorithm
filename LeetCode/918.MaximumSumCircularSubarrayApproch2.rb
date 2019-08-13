# @param {Integer[]} a
# @return {Integer}
def max_subarray_sum_circular(a)
  nums = a + a
  size = a.size
  pre_sums = Array.new(nums.size + 1)
  index = 1
  pre_sums[0] = 0
  pre_sums[1] = nums[0]
  while index < size * 2
    pre_sums[index + 1] = pre_sums[index] + nums[index]
    index += 1
  end
  max_sums = pre_sums[1]
  sums_queue = Array.new
  sums_queue << 0
  index = 1
  while index <= size * 2
    sums_queue.shift if sums_queue.first < index - size
    max_sums = [max_sums, pre_sums[index] - pre_sums[sums_queue.first]].max
    sums_queue.pop while !sums_queue.empty? && pre_sums[sums_queue.last] >= pre_sums[index]
    sums_queue << index
    index += 1
  end
  return max_sums
end
