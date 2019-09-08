# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  rows = Array.new(9) { Array.new(9) { false } }
  columns = Array.new(9) { Array.new(9) { false } }
  sub_boxes = Array.new(9) { Array.new(9) { false } }

  (0..8).each do |row|
    (0..8).each do |column|
      next if board[row][column] == '.'

      number = board[row][column].to_i - 1

      return false if rows[row][number] == true
      return false if columns[column][number] == true
      return false if sub_boxes[row / 3 * 3 + column / 3][number] == true

      rows[row][number] = true
      columns[column][number] = true
      sub_boxes[row / 3 * 3 + column / 3][number] = true
    end
  end
  true
end
