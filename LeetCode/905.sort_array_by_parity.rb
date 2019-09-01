# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity(a)
  return a if a.size < 2

  start_index = 0
  end_index = a.size - 1
  while start_index < end_index
    if (a[start_index] % 2).odd? && (a[end_index] % 2).even?
      a[start_index], a[end_index] = a[end_index], a[start_index]
      start_index += 1
      end_index -= 1
    elsif (a[start_index] % 2).even?
      start_index += 1
    else
      end_index -= 1
    end
  end
  a
end

p sort_array_by_parity([3,1,2,4])