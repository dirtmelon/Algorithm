#
# @lc app=leetcode id=79 lang=ruby
#
# [79] Word Search
#
# @lc code=start
# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  bool_board = Array.new(board.size) { Array.new(board[0].size) { false } }
  (0...board.size).each do |row|
    (0...board[0].size).each do |column|
      next if board[row][column] != word[0]

      return true if find_if_exist(board, word, 0, row, column, bool_board)
    end
  end
  false
end

def find_if_exist(board, word, index, row, column, bool_board)
  return true if word.size == index
  return false if row == -1 || column == -1 || row == board.size || column == board[0].size

  return false if word[index] != board[row][column] || bool_board[row][column]

  bool_board[row][column] = true
  return true if find_if_exist(board, word, index + 1, row, column - 1, bool_board) ||
                 find_if_exist(board, word, index + 1, row - 1, column, bool_board) ||
                 find_if_exist(board, word, index + 1, row + 1, column, bool_board) ||
                 find_if_exist(board, word, index + 1, row, column + 1, bool_board)

  bool_board[row][column] = false
  false
end
# @lc code=end
