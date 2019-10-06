/*
 * @lc app=leetcode id=146 lang=swift
 *
 * [146] LRU Cache
 */

// @lc code=start

class Node {
  var next: Node?
  var pre: Node?
  let key: Int
  var value: Int

  init(key: Int, value: Int) {
    self.key = key
    self.value = value
  }
}

class LRUCache {
  
  private let capacity: Int
  private var cache: [Int: Node] = [:]
  private let head: Node
  private let tail: Node
  private var count = 0

  init(_ capacity: Int) {
    self.capacity = capacity
    head = Node(key: Int.min, value: Int.max)
    tail = Node(key: Int.max, value: Int.max)
    head.next = tail
    tail.pre = head
  }
    
  func get(_ key: Int) -> Int {
    guard let node = cache[key] else { return -1 }
    moveToHead(node)
    return node.value
  }
    
  func put(_ key: Int, _ value: Int) {
    if let node = cache[key] {
      node.value = value
      moveToHead(node)
      return
    }
    let node = Node(key: key, value: value)
    cache[key] = node
    if count == capacity {
      count -= 1
      if let pre = tail.pre {
        remove(pre)
        cache[pre.key] = nil
      }
    }
    count += 1
    add(node)
  }
  
  private func moveToHead(_ node: Node) {
    remove(node)
    add(node)
  }
  
  private func remove(_ node: Node) {
    node.next?.pre = node.pre
    node.pre?.next = node.next
  }
  
  private func add(_ node: Node) {
    node.next = head.next
    node.pre = head
    head.next?.pre = node
    head.next = node
  }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

