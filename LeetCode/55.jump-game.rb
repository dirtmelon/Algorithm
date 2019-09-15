# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  last_index = nums.size - 1
  (nums.size - 1).step(0, -1) do |index|
    last_index = index if (nums[index] + index) >= last_index
  end
  last_index.zero?
end
