#
# @lc app=leetcode id=39 lang=ruby
#
# [39] Combination Sum
#

# @lc code=start
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  result = []
  candidates.each_with_index do |candidate, index|
    if candidate < target
      next_candidates = combination_sum(candidates[index...candidates.size], target - candidate)
      next_candidates.each do |next_candidate|
        result += [[candidate] + next_candidate]
      end
    elsif candidate == target
      result += [[target]]
    else
      next
    end
  end
  result
end
# @lc code=end
