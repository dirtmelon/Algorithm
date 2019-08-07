# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  start_index = search_index(nums, target, 0, nums.size - 1)
  end_index = search_index(nums, target, 0, nums.size - 1)
  return [start_index, end_index] if start_index == -1
  if start_index != 0
    min_start_index = search_start_index(nums, target, 0, start_index - 1)
    start_index = min_start_index if min_start_index != -1
  end
  if end_index != nums.size - 1
    max_end_index = search_end_index(nums, target, end_index + 1, nums.size - 1)
    end_index = max_end_index if max_end_index != -1
  end
  return [start_index, end_index]
end

def search_index(nums, target, start_index, end_index)
  return -1 if end_index < start_index
  mid_index = start_index + (end_index - start_index) / 2
  if nums[mid_index] == target
    return mid_index
  elsif nums[mid_index] < target
    search_index(nums, target, mid_index + 1, end_index)
  else
    search_index(nums, target, start_index, end_index - 1)
  end
end

def search_start_index(nums, target, left_index, right_index)
  mid_index = -1
  while right_index >= left_index
    cur_mid_index = left_index + (right_index - left_index) / 2
    if nums[cur_mid_index] == target
      mid_index = cur_mid_index
      right_index = cur_mid_index - 1
    else
      left_index = cur_mid_index + 1
    end
  end
  return mid_index
end

def search_end_index(nums, target, left_index, right_index)
  mid_index = -1
  while right_index >= left_index
    cur_mid_index = left_index + (right_index - left_index) / 2
    if nums[cur_mid_index] == target
      mid_index = cur_mid_index
      left_index = cur_mid_index + 1
    else
      right_index = cur_mid_index - 1
    end
  end
  return mid_index
end
p search_range([5,7,7,8,8,8,8,11,12,13], 8)
p search_range([5,7,7,8,8,10], 6)
p search_range([1,1,3], 1)
p search_range([1,1,1,1,1,1], 1)
