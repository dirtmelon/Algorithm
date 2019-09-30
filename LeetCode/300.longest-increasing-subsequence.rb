#
# @lc app=leetcode id=300 lang=ruby
#
# [300] Longest Increasing Subsequence
#
# @param {Integer[]} nums
# @return {Integer}
# 动态规划，复杂度 O(n^2)
# def length_of_lis(nums)
#   return 0 if nums.empty?

#   dp = Array.new(nums.size, 1)
#   result = 1
#   nums.each_with_index do |num, index|
#     low = 0
#     high = index - 1
#     while low <= high
#       mid = (low + high) / 2
#       if num > nums[mid]
#         dp[index] = [dp[mid] + 1, dp[index]].max
#         result = [dp[index], result].max
#       end
#       if num[high] > nums[mid] && dp[high] > dp[mid]
#         low = mid + 1
#       else
#         high = mid - 1
#       end
#     end
#   end
#   dp
# end
# 动态规划 + 二分 O(nlogn)
def length_of_lis(nums)
  dp = Array.new(nums.size, 0)
  result = 0
  nums.each do |num|
    low = 0
    high = result
    while low < high
      mid = (low + high) / 2
      if dp[mid] < num
        low = mid + 1
      else
        high = mid
      end
    end
    dp[low] = num
    result += 1 if high == result
  end
  result
end
p length_of_lis [10, 9, 2, 5, 3, 7, 101, 18]
