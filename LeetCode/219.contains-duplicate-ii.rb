#
# @lc app=leetcode id=219 lang=ruby
#
# [219] Contains Duplicate II
#
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = {}
  nums.each_with_index do |num, index|
    return true if hash[num] && (index - hash[num]) <= k

    hash[num] = index
  end
  false
end
