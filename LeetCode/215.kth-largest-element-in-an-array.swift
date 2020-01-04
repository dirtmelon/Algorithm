/*
 * @lc app=leetcode id=215 lang=swift
 *
 * [215] Kth Largest Element in an Array
 */

// @lc code=start
class Solution {
  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums
    var start = 0
    var end = nums.count - 1
    let index = nums.count - k
    while start <= end {
      var position = partition(&nums, start, end)
      if position == index {
        return nums[position]
      } else if position < index {
        start = position + 1
      } else {
        end = position - 1
      }
    }
    return -1
  }

  func partition(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
    let index = start
    let pivot = nums[start]
    var start = start
    var end = end

    while start <= end {
      while start <= end, nums[start] <= pivot {
        start += 1
      }
      while start <= end, nums[end] >= pivot {
        end -= 1
      }
      if start <= end {
        nums.swapAt(start, end)
        start += 1
        end -= 1
      }
    }
    nums.swapAt(index, end)
    return end
  }
}

// @lc code=end