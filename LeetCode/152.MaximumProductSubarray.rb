# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  # return 0 if nums.size == 0
  result = nums[0]
  max_result = nums[0]
  min_result = nums[0]
  index = 1
  while index < nums.size
    number = nums[index]
    max_result, min_result = min_result, max_result if number < 0
    max_result = [max_result * number, number].max
    min_result = [min_result * number, number].min
    index += 1
    result = [max_result, result].max
  end
  return result
end
