#
# @lc app=leetcode id=72 lang=ruby
#
# [72] Edit Distance
#

# @lc code=start
# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  row_count = word1.length
  column_count = word2.length
  dp = Array.new(row_count + 1) { Array.new(column_count + 1, 0) }
  (1..row_count).each do |row|
    dp[row][0] = row
  end
  (1..column_count).each do |column|
    dp[0][column] = column
  end
  (1..row_count).each do |row|
    (1..column_count).each do |column|
      if word1[row - 1] == word2[column - 1]
        dp[row][column] = dp[row - 1][column - 1]
      else
        dp[row][column] = [dp[row - 1][column],
                           dp[row][column - 1],
                           dp[row - 1][column - 1]].min + 1
      end
    end
  end
  dp[row_count][column_count]
end
# @lc code=end
