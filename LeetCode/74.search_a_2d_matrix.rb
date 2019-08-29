# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.empty? || matrix[0].empty?

  nums_size = matrix[0].size
  low = 0
  high = matrix.size - 1
  index = -1
  while low <= high
    mid = low + (high - low) / 2
    if matrix[mid][0] <= target && matrix[mid][nums_size - 1] >= target
      index = mid
      break
    elsif matrix[mid][0] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end
  return false if index == -1

  nums = matrix[index]
  low = 0
  high = nums_size - 1
  while low <= high
    mid = low + (high - low) / 2
    return true if nums[mid] == target

    if nums[mid] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end
  false
end
