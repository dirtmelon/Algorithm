# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
# DFS
# def solve(board)
#   if board.size == 0 || board[0].size == 0 || board.size < 2 || board[0].size < 2
#     return
#   end
#   for index in 0...board[0].size
#     solve_value(0, index, board) if board[0][index] == "O"
#     solve_value(board.size - 1, index, board) if board[board.size - 1][index] == "O"
#   end
#   for index in 0...board.size
#     solve_value(index, 0, board) if board[index][0] == "O"
#     solve_value(index, board[0].size - 1, board) if board[index][board[0].size - 1] == "O"
#   end
#   for row in 0...board.size
#     for column in 0...board[0].size
#       board[row][column] = "X" if board[row][column] == "O"
#       board[row][column] = "O" if board[row][column] == "*"
#     end
#   end
# end

# BFS
# def solve_value(row, column, board)
#   board[row][column] = "*"
#   solve_value(row, column - 1, board) if column > 0 && board[row][column - 1] == "O"
#   solve_value(row, column + 1, board) if column < board[0].size - 1 && board[row][column + 1] == "O"
#   solve_value(row - 1, column, board) if row > 0 && board[row - 1][column] == "O"
#   solve_value(row + 1, column, board) if row < board.size - 1 && board[row + 1][column] == "O"
# end
# def solve(board)
#   if board.size == 0 || board[0].size == 0 || board.size < 2 || board[0].size < 2
#     return
#   end
#   result = []
#   for index in 0...board[0].size
#     if board[0][index] == "O"
#       board[0][index] = "*"
#       result << [0, index]
#     end
#     if board[board.size - 1][index] == "O"
#       board[board.size - 1][index] = "*"
#       result << [board.size - 1, index]
#     end
#   end
#   for index in 0...board.size
#     if board[index][0] == "O"
#       board[index][0] == "*"
#       result << [index, 0]
#     end
#     if board[index][board[0].size - 1] == "O"
#       board[index][board[0].size - 1] = "*"
#       result << [index, board[0].size - 1]
#     end
#   end
#   while !result.empty?
#     cur = result.shift
#     if cur.last > 0 && board[cur.first][cur.last - 1] == "O"
#       board[cur.first][cur.last - 1] = "*"
#       result << [cur.first, cur.last - 1]
#     end
#     if cur.last < board[0].size - 1 && board[cur.first][cur.last + 1] == "O"
#       board[cur.first][cur.last + 1] = "*"
#       result << [cur.first, cur.last + 1]
#     end
#     if cur.first > 0 && board[cur.first - 1][cur.last] == "O"
#       board[cur.first - 1][cur.last] = "*"
#       result << [cur.first - 1, cur.last]
#     end
#     if cur.first < board.size - 1 && board[cur.first + 1][cur.last] == "O"
#       board[cur.first + 1][cur.last] = "*"
#       result << [cur.first + 1, cur.last]
#     end
#   end
#   for row in 0...board.size
#     for column in 0...board[0].size
#       board[row][column] = "X" if board[row][column] == "O"
#       board[row][column] = "O" if board[row][column] == "*"
#     end
#   end
#   return board
# end

# Union Find
def solve(board)
  if board.size == 0 || board[0].size == 0 || board.size < 2 || board[0].size < 2
    return
  end
  union_tree = Array.new(board.size * board[0].size + 1)
  rank = Array.new(board.size * board[0].size + 1)

  for index in 0...union_tree.size
    union_tree[index] = index
    rank[index] = 0
  end
  for row in 0...board.size
    for column in 0...board[0].size
      next if board[row][column] != "O"
      if (row == 0 || column == 0 || row == board.size - 1 || column == board[0].size - 1)
        union(row * board[0].size + column, board.size * board[0].size, rank, union_tree)
      else
        union(row * board[0].size + column, row * board[0].size + column - 1, rank, union_tree) if board[row][column - 1] == "O"
        union(row * board[0].size + column, row * board[0].size + column + 1, rank, union_tree) if board[row][column + 1] == "O"
        union(row * board[0].size + column, (row - 1) * board[0].size + column, rank, union_tree) if board[row - 1][column] == "O"
        union(row * board[0].size + column, (row + 1) * board[0].size + column, rank, union_tree) if board[row + 1][column] == "O"
      end
    end
  end
  for row in 0...board.size
    for column in 0...board[0].size
      next if board[row][column] != "O"
      board[row][column] = "X" if find(row * board[0].size + column, union_tree) != find(board.size * board[0].size, union_tree)
    end
  end
  return board
end
def find(index, union_tree)
  return index if union_tree[index] == index
  return union_tree[index] = find(union_tree[index], union_tree)
end

def union(left, right, rank, union_tree)
  left = find(left, union_tree)
  right = find(right, union_tree)
  return if left == right
  if rank[left] < rank[right]
    union_tree[left] = right
  else
    union_tree[right] = left
    if rank[left] == rank[right]
      rank[left] += 1
    end
  end
end

p solve([["X","O","X","O","X","O"],["O","X","O","X","O","X"],["X","O","X","O","X","O"],["O","X","O","X","O","X"]])
# p [[1,2]].include?([1,2])
