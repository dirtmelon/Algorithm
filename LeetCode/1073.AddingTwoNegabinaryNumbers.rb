# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def add_negabinary(arr1, arr2)
  arr1_size = arr1.size
  arr2_size = arr2.size
  arr3 = Array.new [arr1_size, arr2_size].max + 2, 0
  arr1_index = arr1_size - 1
  arr2_index = arr2_size - 1
  arr3_index = [arr1_size, arr2_size].max + 1
  next_value = 0
  is_opposite = true
  while arr1_index >= 0 || arr2_index >= 0 || next_value > 0
    current_value = 0
    if arr1_index >= 0
      current_value += arr1[arr1_index]
    end
    if arr2_index >= 0
      current_value += arr2[arr2_index]
    end
    if current_value == 0
      if next_value == 0
        arr3[arr3_index] = 0
      elsif is_opposite
        arr3[arr3_index] = 1
        is_opposite = false
      else
        arr3[arr3_index] = 1
        next_value = 0
      end
    elsif current_value == 1
      if next_value == 0
        arr3[arr3_index] = 1
      elsif is_opposite
        arr3[arr3_index] = 0
        next_value = 0
      else
        arr3[arr3_index] = 0
        is_opposite = true
      end
    else
      if next_value == 0
        arr3[arr3_index] = 0
        next_value = 1
        is_opposite = true
      elsif is_opposite
        arr3[arr3_index] = 1
        next_value = 0
      else
        arr3[arr3_index] = 1
        next_value = 1
        is_opposite = true
      end
    end
    arr1_index -= 1
    arr2_index -= 1
    arr3_index -= 1
    p arr3, is_opposite, next_value
  end
  while arr3.first == 0
    arr3.shift
  end
  return [0] if arr3.empty?
  return arr3
end

# p add_negabinary([1], [1,0,1])
# p add_negabinary([1,1,1,1,1], [1,0,1])
# p add_negabinary([1], [1,1])
# p add_negabinary([0],[1,1])
# p add_negabinary([0], [0])
# p add_negabinary([1,1,1,1,1], [1,0,1])
p add_negabinary([1,0,1], [1,0,1])
