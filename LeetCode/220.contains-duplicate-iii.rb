#
# @lc app=leetcode id=220 lang=ruby
#
# [220] Contains Duplicate III
#
# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  return false if t < 0

  buckets = {}
  width = t + 1
  nums.each_with_index do |num, index|
    bucket_index = get_bucket_index(num, width)
    return true if buckets.key?(bucket_index)

    return true if buckets.key?(bucket_index - 1) && (num - buckets[bucket_index - 1]).abs < width

    return true if buckets.key?(bucket_index + 1) && (num - buckets[bucket_index + 1]).abs < width

    buckets[bucket_index] = num
    buckets.delete(get_bucket_index(nums[index - k], width)) if index >= k
  end
  false
end

def get_bucket_index(num, width)
  num / width
end
