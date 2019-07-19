# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  result = []
  return [] if nums.size < 3
  nums.sort!
  (0..(nums.size - 3)).each { |i|
    next if nums[i] == nums[i - 1] and i > 0
    startIndex = i + 1
    endIndex = nums.size - 1
    while startIndex < endIndex
      value = nums[i] + nums[startIndex] + nums[endIndex]
      if value == 0
        result << [nums[i], nums[startIndex], nums[endIndex]]
        startIndex += 1
        endIndex -= 1
        startIndex += 1 while nums[startIndex] == nums[startIndex - 1]
        endIndex -= 1 while nums[endIndex] == nums[endIndex + 1]
      elsif value < 0
        startIndex += 1
      else
        endIndex -= 1
      end
    end
  }
  result
end

puts three_sum([0,0,0])
