# @param {String} s
# @param {String} t
# @return {Boolean}
# def is_anagram(s, t)
#   char_hash = Hash.new(0)
#   s.each_char do |char|
#     char_hash[char] += 1
#   end
#   t.each_char do |char|
#     char_hash[char] -= 1
#   end
#   char_hash.reject { |_, value| value.zero? }.keys.empty?
# end

def is_anagram(s, t)
  s.chars.sort == t.chars.sort
end