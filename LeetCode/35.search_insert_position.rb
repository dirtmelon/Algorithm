# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  low = 0
  high = nums.size - 1
  while low <= high
    mid = low + (high - low) / 2
    return mid if nums[mid] == target

    if nums[mid] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end

  low
end
