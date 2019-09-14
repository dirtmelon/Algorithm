#
# @lc app=leetcode id=54 lang=ruby
#
# [54] Spiral Matrix
#
# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.empty?

  result = []
  # 遍历方向，0，1，2，3表示右，下，左，上
  direction = 0
  start_row = 0
  end_row = matrix.size - 1
  start_column = 0
  end_column = matrix[0].size - 1
  while start_row <= end_row && start_column <= end_column
    case direction
    when 0
      (start_column..end_column).each do |column|
        result << matrix[start_row][column]
      end
      start_row += 1
      direction = 1
    when 1
      (start_row..end_row).each do |row|
        result << matrix[row][end_column]
      end
      end_column -= 1
      direction = 2
    when 2
      end_column.step(start_column, -1).each do |column|
        result << matrix[end_row][column]
      end
      end_row -= 1
      direction = 3
    when 3
      end_row.step(start_row, -1).each do |row|
        result << matrix[row][start_column]
      end
      start_column += 1
      direction = 0
    end
  end
  result
end
