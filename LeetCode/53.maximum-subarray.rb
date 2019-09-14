#
# @lc app=leetcode id=53 lang=ruby
#
# [53] Maximum Subarray
#
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max = nums.first
  cur_result = 0
  nums.each do |num|
    cur_result += num
    max = cur_result if cur_result > max
    cur_result = 0 if cur_result.negative?
  end
  max
end

p max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
