# @param {Integer[]} answers
# @return {Integer}
def num_rabbits(answers)
  total = 0
  numbers = Hash.new
  answers.each { |answer|
    if numbers[answer] == nil or numbers[answer] == 0
      total += answer + 1
      numbers[answer] = answer
    else
      numbers[answer] -= 1
    end
  }
  return total
end
