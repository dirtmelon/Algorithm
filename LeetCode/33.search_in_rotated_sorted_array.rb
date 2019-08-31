# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  end_index = nums.size - 1
  start_index = 0
  while start_index <= end_index
    mid = (end_index - start_index) / 2 + start_index
    return mid if nums[mid] == target

    if nums[start_index] <= nums[mid]
      if nums[start_index] <= target && target < nums[mid]
        end_index = mid - 1
      else
        start_index = mid + 1
      end
    else
      if nums[end_index] >= target && target > nums[mid]
        start_index = mid + 1
      else
        end_index = mid - 1
      end
    end
  end
  -1
end
