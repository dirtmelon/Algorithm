# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  n.positive? && (1_162_261_467 % n).zero?
end
