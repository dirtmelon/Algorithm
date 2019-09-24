#
# @lc app=leetcode id=174 lang=ruby
#
# [174] Dungeon Game
#
# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  dp = Array.new(dungeon.size) { Array.new(dungeon[0].size, 0) }
  row_size = dungeon.size
  column_size = dungeon[0].size
  dp[row_size - 1][column_size - 1] = [-dungeon[row_size - 1][column_size - 1], 0].max + 1
  (column_size - 2).step(0, -1) do |column|
    dp[row_size - 1][column] = [1, dp[row_size - 1][column + 1] - dungeon[row_size - 1][column]].max
  end
  (row_size - 2).step(0, -1) do |row|
    dp[row][column_size - 1] = [1, dp[row + 1][column_size - 1] - dungeon[row][column_size - 1]].max
  end
  (row_size - 2).step(0, -1) do |row|
    (column_size - 2).step(0, -1) do |column|
      dp[row][column] = [1, [dp[row + 1][column], dp[row][column + 1]].min - dungeon[row][column]].max
    end
  end
  dp[0][0]
end
