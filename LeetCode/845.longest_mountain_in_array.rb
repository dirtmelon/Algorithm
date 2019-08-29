# @param {Integer[]} a
# @return {Integer}
def longest_mountain(a)
  return 0 if a.size < 3

  bottom_to_up = true
  res = 0
  start_index = 0
  end_index = 0
  (1...a.size).each do |index|
    end_index = index

    # 如果是在下山，则 start_index 为 index - 1，endIndex = index，bottom_to_up 重置为 true
    if a[index] > a[index - 1] && !bottom_to_up
      bottom_to_up = true
      start_index = index - 1
      end_index = index
    elsif a[index] < a[index - 1]
      if bottom_to_up
        # 如果是在爬山，则转为下山且上山的长度大于1
        if end_index - start_index > 1
          res = [res, end_index - start_index + 1].max
          bottom_to_up = false
        else
          start_index = index
        end
      else
        res = [res, end_index - start_index + 1].max
      end
    elsif a[index] == a[index - 1]
      bottom_to_up = true
      start_index = index
    end
  end
  res
end

p longest_mountain([2, 2,2])
