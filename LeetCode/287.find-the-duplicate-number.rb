#
# @lc app=leetcode id=287 lang=ruby
#
# [287] Find the Duplicate Number
#
# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  fast = nums[nums[0]]
  slow = nums[0]
  while nums[slow] != nums[fast]
    slow = nums[slow]
    fast = nums[nums[fast]]
  end
  first = 0
  second = slow
  while nums[first] != nums[second]
    first = nums[first]
    second = nums[second]
  end
  nums[first]
end
