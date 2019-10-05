#
# @lc app=leetcode id=40 lang=ruby
#
# [40] Combination Sum II
#

# @lc code=start
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  combination_sum(candidates.sort, target)
end

def combination_sum(candidates, target)
  result = []
  candidates.each_with_index do |candidate, index|
    next if index.positive? && candidates[index] == candidates[index - 1]
    break if candidates[index] > target

    if candidate < target
      next_candidates = combination_sum2(candidates[(index + 1)...candidates.size], target - candidate)
      next_candidates.each do |next_candidate|
        result += [[candidate] + next_candidate]
      end
    else
      result += [[target]]
    end
  end
  result
end
# @lc code=end
