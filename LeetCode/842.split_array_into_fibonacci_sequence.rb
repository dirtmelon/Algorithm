# @param {String} s
# @return {Integer[]}
def split_into_fibonacci(s)
  results = []
  find_fibonacci(s, 0, results)
  results
end

def find_fibonacci(s, start_index, results)
  return true if s.size == start_index && results.size >= 3

  (start_index...s.size).each do |index|
    return false if s[start_index] == '0' && index > start_index

    result = s[start_index..index].to_i
    return false if result > (2**31 - 1)
    break if results.size >= 2 && result > (results[results.size - 1] + results[results.size - 2])

    next unless results.size < 2 || (results[results.size - 1] + results[results.size - 2]) == result

    results << result
    return true if find_fibonacci(s, index + 1, results)

    results.pop
  end
  false
end
