# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  return 0 if nums.empty?

  size = nums.size
  result = nums.size + 1
  start_index = 0
  end_index = 0
  sum = 0
  while end_index < size
    sum += nums[end_index]
    while sum >= s
      result = [result, end_index - start_index + 1].min
      sum -= nums[start_index]
      start_index += 1
    end
    end_index += 1
  end

  result == nums.size + 1 ? 0 : result
end
