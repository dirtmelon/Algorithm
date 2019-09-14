#
# @lc app=leetcode id=49 lang=ruby
#
# [49] Group Anagrams
#
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  anagrams = Hash.new { |hash, key| hash[key] = [] }
  strs.each do |str|
    sort_str = str.chars.sort
    anagrams[sort_str] << str
  end
  anagrams.values
end
