# @param {Integer[]} numsm
# @return {Integer}
def first_missing_positive(nums)
  return 1 if nums.empty?

  size = nums.size
  (0...size).each do |index|
    while (nums[index]).positive? &&
          nums[index] <= size &&
          nums[nums[index] - 1] != nums[index]
      nums[nums[index] - 1], nums[index] = nums[index], nums[nums[index] - 1]
    end
  end
  p nums
  (0...size).each do |index|
    return index + 1 if nums[index] != index + 1
  end
  size + 1
end
