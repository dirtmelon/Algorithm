# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.empty?

  start_index, end_index = 0, 1

  while end_index < nums.size
    if nums[start_index] != nums[end_index]
      start_index += 1
      nums[start_index] = nums[end_index]
    end
    end_index += 1
  end
  start_index + 1
end
