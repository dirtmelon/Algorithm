#
# @lc app=leetcode id=217 lang=ruby
#
# [217] Contains Duplicate
#
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  hash = {}
  nums.each do |num|
    return true if hash[num] == num

    hash[num] = num
  end
  false
end
