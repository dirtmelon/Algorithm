# @param {Integer[]} nums
# @return {Integer[][]}
# def find_subsequences(nums)
#   size = 2
#   results = []
#   while size <= nums.size
#     for index in 0..(nums.size) - size
#       results += find_sequences(size, index, nums)
#     end
#     size += 1
#   end
#   return results
# end

# def find_sequences(size, start_index, nums)
#   return [] if size == 0
#   results = []
#   if size == 1
#     for index in start_index..(nums.size - size)
#       next if nums[index + 1] == nums[index] && index < nums.size - size
#       next if nums[index] < nums[start_index - 1]
#       results << [nums[index]]
#     end
#   elsif size - 1 == 1
#     subsequences = find_sequences(size - 1, start_index + 1, nums)
#     subsequences.each do |subsequence|
#       results << [nums[start_index]] + subsequence if subsequence.size == size - 1
#     end
#   else
#     for index in (start_index + 1)..(nums.size - size + 1)
#       next if nums[index] < nums[start_index]
#       subsequences = find_sequences(size - 1, index, nums)
#       subsequences.each do |subsequence|
#         result = [nums[start_index]] + subsequence
#         results << result if subsequence.size == size - 1 && !results.include?(result)
#       end
#     end
#   end
#   return results
# end
# DFS
def find_subsequences(nums)
  results = []
  find_sequences([], 0, nums, results)
  return results
end

def find_sequences(result, start_index, nums, results)
  results << Array.new(result) if result.size > 1
  used = []
  for index in start_index...nums.size
    next if used.include? nums[index]
    if result.size == 0 || nums[index] >= result.last
      used << nums[index]
      result << nums[index]
      find_sequences(result, index + 1, nums, results)
      result.pop
    end
  end
end
