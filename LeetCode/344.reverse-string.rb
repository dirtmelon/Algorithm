#
# @lc app=leetcode id=344 lang=ruby
#
# [344] Reverse String
#
# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
  size = s.size
  (0...s.size / 2).each do |index|
    s[index], s[size - 1 - index] = s[size - 1 - index], s[index]
  end
end
