# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  low = 0
  high = nums.size - 1
  while low < high
    mid = low + (high - low) / 2
    if nums[high] == nums[mid]
      high -= 1
      next
    end
    if nums[high] >= nums[mid]
      high = mid
    else
      low = mid + 1
    end
  end
  nums[low]
end
