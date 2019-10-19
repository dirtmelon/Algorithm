/*
 * @lc app=leetcode id=911 lang=swift
 *
 * [911] Online Election
 */

// @lc code=start

class Vote {
    let time: Int
    let person: Int

    init(time: Int, person: Int) {
        self.time = time
        self.person = person
    }
}

class TopVotedCandidate {
    private var results: [Vote] = []
    private var cache: [Int: Int] = [:]
    private var max: Int = 0

    init(_ persons: [Int], _ times: [Int]) {
        for (index, person) in persons.enumerated() {
            let time = times[index]
            let vote = (cache[person] ?? 0) + 1
            cache[person] = vote
            if vote >= max {
                results += [Vote(time: time, person: person)]
                max = vote
            }
        }
    }
    
    func q(_ t: Int) -> Int {
        var low = 1
        var high = results.count
        while low < high {
            let mid = low + (high - low) / 2
            if results[mid].time <= t {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return results[low - 1].person
    }
}
/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * let obj = TopVotedCandidate(persons, times)
 * let ret_1: Int = obj.q(t)
 */
// @lc code=end

