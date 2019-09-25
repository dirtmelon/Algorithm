#
# @lc app=leetcode id=240 lang=ruby
#
# [240] Search a 2D Matrix II
#
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
# 每一行从左到右是递增
# 每一列从上到下是递增
# 先对行进行二分，选出有可能满足的行，再对可能满足的行进行列二分。
def search_matrix(matrix, target)
  return false if matrix.empty? || matrix[0].empty?

  low_row = 0
  high_row = matrix.size - 1
  column_size = matrix[0].size - 1
  start_row = 0
  end_row = 0
  # search start row
  while low_row <= high_row
    mid_row = (low_row + high_row) / 2
    if target >= matrix[mid_row][0] && target <= matrix[mid_row][column_size]
      start_row = mid_row
      high_row = mid_row - 1
    elsif target < matrix[mid_row][0]
      high_row = mid_row - 1
    else
      low_row = mid_row + 1
    end
  end

  # search end row
  low_row = start_row
  high_row = matrix.size - 1
  while low_row <= high_row
    mid_row = (low_row + high_row) / 2
    if target >= matrix[mid_row][0] && target <= matrix[mid_row][column_size]
      end_row = mid_row
      low_row = mid_row + 1
    elsif target < matrix[mid_row][0]
      high_row = mid_row - 1
    else
      low_row = mid_row + 1
    end
  end
  (start_row..end_row).each do |row|
    low_column = 0
    high_column = column_size
    while low_column <= high_column
      mid_column = (high_column + low_column) / 2
      return true if target == matrix[row][mid_column]

      if target > matrix[row][mid_column]
        low_column = mid_column + 1
      else
        high_column = mid_column - 1
      end
    end
  end
  false
end
