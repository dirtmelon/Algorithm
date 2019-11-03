#
# @lc app=leetcode id=1248 lang=ruby
#
# [1248] Count Number of Nice Subarrays
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def number_of_subarrays(nums, k)
  find_number_of_subarrays(nums, k) - find_number_of_subarrays(nums, k - 1)
end

def find_number_of_subarrays(nums, k)
  left = 0
  result = 0
  (0...nums.size).each do |right|
    k -= nums[right] % 2
    while k.negative?
      k += nums[left] % 2
      left += 1
    end
    result += right - left + 1
  end
  result
end
# @lc code=end
