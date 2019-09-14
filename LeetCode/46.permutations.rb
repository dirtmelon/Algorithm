#
# @lc app=leetcode id=46 lang=ruby
#
# [46] Permutations
#
# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  return [nums] if nums.size == 1

  result = []
  (0...nums.size).each do |index|
    first = nums[index]
    sub_nums = nums[0...index] + nums[(index + 1)..nums.size]
    permute_sub_nums = permute(sub_nums)
    permute_sub_nums.each do |array|
      result << [first] + array
    end
  end
  result
end
