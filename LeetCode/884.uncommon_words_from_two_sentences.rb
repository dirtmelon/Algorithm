# @param {String} a
# @param {String} b
# @return {String[]}
def uncommon_from_sentences(a, b)
  words = Hash.new(0)
  (a + ' ' + b).split(' ').each do |word|
    words[word] += 1
  end
  words.select { |key| words[key] == 1 }.keys
end
