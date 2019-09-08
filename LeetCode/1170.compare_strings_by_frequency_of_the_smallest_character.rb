# @param {String[]} queries
# @param {String[]} words
# @return {Integer[]}
def num_smaller_by_frequency(queries, words)
  smallests = []
  words.each do |word|
    smallests << frequency_of_smallest_character(word)
  end
  smallests.sort!
  p smallests
  results = []
  queries.each do |query|
    index = 0
    smallest_of_query = frequency_of_smallest_character(query)
    low = 0
    high = smallests.size - 1
    while low <= high
      mid = low + (high - low) / 2
      if smallest_of_query >= smallests[mid]
        low = mid + 1
      elsif mid - 1 >= 0
        if smallest_of_query >= smallests[mid - 1]
          index = mid
          break
        end
        high = mid - 1
      else
        index = 0
        break
      end
      index = -1
    end

    results << if index != -1
                 smallests.size - index
               else
                 0
               end
  end
  results
end

def frequency_of_smallest_character(word)
  result = 0
  chars = word.chars.sort
  smallest = chars[0]
  chars.each do |char|
    break unless char == smallest

    result += 1
  end
  result
end

# p num_smaller_by_frequency(['cbd'], ['zaaaz'])
p num_smaller_by_frequency(["bba","abaaaaaa","aaaaaa","bbabbabaab","aba","aa","baab","bbbbbb","aab","bbabbaabb"],
    ["aaabbb","aab","babbab","babbbb","b","bbbbbbbbab","a","bbbbbbbbbb","baaabbaab","aa"])