#
# @lc app=leetcode id=78 lang=ruby
#
# [78] Subsets
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
# Iteratively
def subsets(nums)
  results = [[]]
  nums.each do |num|
    results += results.map { |result| result + [num] }
  end
  results
end

# Recursively
# O(n!)
def subsets1(nums)
  find_subsets(nums, 0, [])
end

def find_subsets(nums, start, pre_result)
  result = [pre_result]
  (start...nums.size).each do |index|
    result += find_subsets(nums, index + 1, [nums[index]] + pre_result)
  end
  result
end

# Bit Manipulation
def subsets2(nums)
  result_size = 1 << nums.size
  result = Array.new(result_size) { [] }
  (0...result_size).each do |result_index|
    (0...nums.size).each do |num_index|
      result[result_index] << nums[num_index] if ((result_index >> num_index) & 1) == 1
    end
  end
  result
end
# @lc code=end
p subsets([1, 2, 3])
