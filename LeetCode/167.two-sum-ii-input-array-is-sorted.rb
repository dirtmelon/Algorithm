#
# @lc app=leetcode id=167 lang=ruby
#
# [167] Two Sum II - Input array is sorted
#
# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
# 二分
def two_sum(numbers, target)
  size = numbers.size
  (0...size).each do |first_index|
    low = first_index + 1
    high = size - 1
    while low <= high
      mid = low + (high - low) / 2
      return [first_index + 1, mid + 1] if (numbers[first_index] + numbers[mid]) == target

      if (numbers[first_index] + numbers[mid]) > target
        high = mid - 1
      else
        low = mid + 1
      end
    end
  end
  end

# 双指针
def two_sum(numbers, target)
  first_index = 0
  last_index = numbers.size - 1
  while (numbers[first_index] + numbers[last_index]) != target
    if (numbers[first_index] + numbers[last_index]) > target
      last_index -= 1
    else
      first_index += 1
    end
  end
  [first_index + 1, last_index + 1]
end
