# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  s.each_char { |character|
    if character == "{" or character == "[" or character == "("
      stack.push(character)
    else
      left = stack.pop
      if !((character == "}" and left == "{") or
           (character == "]" and left == "[") or
           (character == ")" and left == "("))
        return false
      end
    end
  }
  return stack.size == 0
end
