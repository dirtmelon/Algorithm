#
# @lc app=leetcode id=473 lang=ruby
#
# [473] Matchsticks to Square
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def makesquare(nums)
  return false if nums.nil? || nums.size < 4

  total = 0
  nums.each do |num|
    total += num
  end
  return false if total % 4 != 0

  sides = Array.new(4, 0)
  find_sides(nums.sort.reverse, 0, total / 4, sides)
end

def find_sides(nums, num_index, average, sides)
  return true if num_index == nums.size

  num = nums[num_index]
  (0...sides.size).each do |index|
    next if ((sides[index] + num) > average) || (index > 0 && sides[index] == sides[index - 1])

    sides[index] += num
    return true if find_sides(nums, num_index + 1, average, sides)

    sides[index] -= num
  end
  false
end
# @lc code=end
