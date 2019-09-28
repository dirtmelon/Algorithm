#
# @lc app=leetcode id=275 lang=ruby
#
# [275] H-Index II
#
# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  return 0 if citations.empty?

  size = citations.size
  low = 0
  high = citations.size - 1
  result = 0
  while low <= high
    mid = (low + high) / 2
    if (size - mid - 1) < citations[mid] && (size - mid) <= citations[mid]
      high = mid - 1
      result = size - mid if size - mid > result
      next
    end
    if (size - mid - 1) < citations[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end
  result
end
