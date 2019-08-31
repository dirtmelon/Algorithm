# @param {Integer} n
# @return {Integer}
def count_primes(n)
  return 0 if n < 2

  is_primes = Array.new n, true
  result = 0
  (2...n).each do |num|
    next unless is_primes[num]

    result += 1
    value = 2
    while value * num < n
      is_primes[value * num] = false
      value += 1
    end
  end
  result
end
