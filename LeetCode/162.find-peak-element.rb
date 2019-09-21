#
# @lc app=leetcode id=162 lang=ruby
#
# [162] Find Peak Element
#
# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  size = nums.size
  return 0 if nums.size == 1

  low = 0
  high = nums.size - 1
  while low <= high
    mid = (low + high) / 2
    if mid.zero?
      return mid if nums[mid] > nums[1]

      low = mid + 1
    elsif mid == (size - 1)
      return mid if nums[mid] > nums[size - 2]

      high = mid - 1
    elsif nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1]
      return mid
    elsif nums[mid - 1] > nums[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end
end
