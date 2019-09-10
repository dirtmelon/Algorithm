#
# @lc app=leetcode id=6 lang=ruby
#
# [6] ZigZag Conversion
#
# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1

  result = []
  chars = s.chars
  size = chars.size
  divide = (num_rows - 1) * 2
  (0...num_rows).each do |row|
    0.step(size - row - 1, divide) do |index|
      result << chars[index + row]
      result << chars[index + divide - row] if row != 0 && row != num_rows - 1 && index + divide - row < size
    end
  end
  result.join.to_s
end
