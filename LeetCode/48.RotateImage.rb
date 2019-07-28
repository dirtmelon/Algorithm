# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  for i in 0...matrix.size
    for j in i...matrix.size
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end
  for i in 0...(matrix.size / 2)
    for j in 0...matrix.size
      matrix[j][i], matrix[j][matrix.size - 1 - i] = matrix[j][matrix.size - 1 - i], matrix[j][i]
    end
  end
end
