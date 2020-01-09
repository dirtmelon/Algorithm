/*
 * @lc app=leetcode id=207 lang=swift
 *
 * [207] Course Schedule
 */

// @lc code=start
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = Array(repeating: [Int](), count: numCourses)
        var toVisit = Array(repeating: false, count: numCourses)
        var visited = Array(repeating: false, count: numCourses)

        func containCircle(_ index: Int) -> Bool {
            if toVisit[index] {
                return false
            }
            if visited[index] {
                return true
            }
            visited[index] = true
            toVisit[index] = true
            for course in graph[index] {
                if !containCircle(course) {
                    return false
                }
            }
            toVisit[index] = false
            return true
        }

        for prerequisite in prerequisites {
            graph[prerequisite[0]].append(prerequisite[1])
        }
        for index in 0 ..< numCourses {
            if visited[index] {
                continue
            }
            if !containCircle(index) {
                return false
            }
        }
        return true
    }
}

// @lc code=end