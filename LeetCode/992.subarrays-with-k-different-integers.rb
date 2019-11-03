#
# @lc app=leetcode id=992 lang=ruby
#
# [992] Subarrays with K Different Integers
#

# @lc code=start
# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def subarrays_with_k_distinct(a, k)
  find_subarrays_with_k_distinct(a, k) - find_subarrays_with_k_distinct(a, k - 1)
end

def find_subarrays_with_k_distinct(a, k)
  result = 0
  left = 0
  hash = Hash.new { -1 }
  a.each_with_index do |num, right|
    k -= 1 if hash[num] == -1
    hash[num] = right
    while k.negative?
      left_num = a[left]
      if hash[left_num] == left
        k += 1
        hash[left_num] = -1
      end
      left += 1
    end
    result += right - left + 1
  end
  result
end
# @lc code=end
