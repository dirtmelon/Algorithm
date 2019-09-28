#
# @lc app=leetcode id=278 lang=ruby
#
# [278] First Bad Version
#
# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  return 1 if n == 1

  low = 1
  high = n
  while low <= high
    mid = (low + high) >> 1
    if is_bad_version(mid)
      high = mid - 1
    else
      low = mid + 1
    end
  end
  high + 1
end
