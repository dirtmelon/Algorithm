#
# @lc app=leetcode id=58 lang=ruby
#
# [58] Length of Last Word
#

# @lc code=start
# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  array = s.split
  return 0 if array.empty?

  array.last.size
end
# @lc code=end
