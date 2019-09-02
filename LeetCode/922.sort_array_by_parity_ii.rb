# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity_ii(a)
  odds = []
  evens = []
  (0...a.size).each do |index|
    if a[index].odd? && index.even?
      odds << index
    elsif a[index].even? && index.odd?
      evens << index
    end
  end
  (0...odds.size).each do |index|
    a[odds[index]], a[evens[index]] = a[evens[index]], a[odds[index]]
  end
  a
end
