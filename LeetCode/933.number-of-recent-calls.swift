/*
 * @lc app=leetcode id=933 lang=swift
 *
 * [933] Number of Recent Calls
 */

// @lc code=start

class RecentCounter {

  var queue: [Int] = []
  
  init() {  
  }
    
  func ping(_ t: Int) -> Int {
    while let first = queue.first, t - first > 3000 {
      queue.removeFirst()
    }
    queue.append(t)
    return queue.count
  }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
// @lc code=end

