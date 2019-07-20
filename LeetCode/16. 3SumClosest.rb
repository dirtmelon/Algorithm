# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  minValue = nums[0] + nums[1] + nums[2]
  (0..(nums.size - 3)).each { |i|
    next if i > 0 and nums[i] == nums[i - 1]
    startIndex = i + 1
    endIndex = nums.size - 1
    while startIndex < endIndex
      value = nums[i] + nums[startIndex] + nums[endIndex]
      distance = value - target
      return value if distance == 0
      minValue = value if distance.abs < (minValue - target).abs
      if distance < 0
        startIndex += 1
      else
        endIndex -= 1
      end
      startIndex += 1 while nums[startIndex - 1] == nums[startIndex]
      endIndex -= 1 while nums[endIndex + 1] == nums[endIndex]
    end
  }
  return minValue
end
