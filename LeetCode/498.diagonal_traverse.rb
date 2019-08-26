# @param {Integer[][]} matrix
# @return {Integer[]}
def find_diagonal_order(matrix)
  return [] if matrix.empty?

  result = []
  bottom_to_top = true
  row = 0
  column = 0
  while row < matrix.size && column < matrix[0].size
    result << matrix[row][column]
    if bottom_to_top
      if column == matrix[0].size - 1
        row += 1
        bottom_to_top = false
      elsif row.zero?
        column += 1
        bottom_to_top = false
      else
        row -= 1
        column += 1
      end
    else
      if row == matrix.size - 1
        column += 1
        bottom_to_top = true
      elsif column.zero?
        row += 1
        bottom_to_top = true
      else
        row += 1
        column -= 1
      end
    end
  end
  result
end
