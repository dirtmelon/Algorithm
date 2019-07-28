# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  return nums1 if n == 0
  firts_end_index = m - 1
  second_end_index = n - 1
  end_index = m + n - 1
  while firts_end_index >= 0 && second_end_index >= 0
    if nums1[firts_end_index] < nums2[second_end_index]
      nums1[end_index] = nums2[second_end_index]
      end_index -= 1
      second_end_index -= 1
    else
      nums1[end_index] = nums1[firts_end_index]
      end_index -= 1
      firts_end_index -= 1
    end
  end
  nums1[0...second_end_index] = nums2[0...second_end_index] if second_end_index >= 0
end
