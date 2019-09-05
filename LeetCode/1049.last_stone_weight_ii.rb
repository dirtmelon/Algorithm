# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight_ii(stones)
  stones_sum = stones.reduce(:+)
  target_sum = stones_sum / 2
  dp = Array.new(target_sum + 1, 0)
  stones.each do |stone|
    target_sum.step(stone, -1).each do |i|
      dp[i] = [dp[i], dp[i - stone] + stone].max
    end
  end
  stones_sum - dp[target_sum] * 2
end
