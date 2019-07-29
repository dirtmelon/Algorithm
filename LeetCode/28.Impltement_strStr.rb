# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.size == 0
  start_index = 0
  while start_index <= haystack.size - needle.size
    return start_index if haystack[start_index..start_index+needle.size-1] == needle
    start_index += 1
  end
  return -1
end

p str_str("mississippi","pi")
