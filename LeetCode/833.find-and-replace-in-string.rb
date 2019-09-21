#
# @lc app=leetcode id=833 lang=ruby
#
# [833] Find And Replace in String
#
# @param {String} s
# @param {Integer[]} indexes
# @param {String[]} sources
# @param {String[]} targets
# @return {String}
def find_replace_string(s, indexes, sources, targets)
  indexes.zip(sources, targets).sort.reverse.each do |index, source, target|
    next if s[index...(index + source.size)] != source

    s[index...(index + source.size)] = target
  end
  s
end
