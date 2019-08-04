# @param {String} s
# @return {Integer}
def calculate(s)
  return s.to_i if s.size == 1
  # s << "+"
  pre_value = 0
  result = 0
  operator = "+"
  index = 0
  while index < s.size
    chr = s[index]
    cur_value = 0
    if chr == " "
      index += 1
      next
    end
    if !(" +-/*".include? chr)
      end_index = index
      while end_index <= s.size - 1
        break if (" +-*/".include? s[end_index])
        end_index += 1
      end
      cur_value = s[index...end_index].to_f
      index = end_index
    end
    if s[index] == " "
      index += 1
    end
    if operator == "+"
      result += pre_value
      pre_value = cur_value
    elsif operator == "-"
      result += pre_value
      pre_value = -cur_value
    elsif operator == "/"
      pre_value = pre_value < 0 ? (pre_value / cur_value).ceil : (pre_value / cur_value).floor
    elsif operator == "*"
      pre_value = pre_value * cur_value
    end
    next if index == s.size
    if "+-/*".include? s[index]
      operator = s[index]
    end
    index += 1
  end
  result += pre_value
  return result.to_i
end
