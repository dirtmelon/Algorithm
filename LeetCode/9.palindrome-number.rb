#
# @lc app=leetcode id=9 lang=ruby
#
# [9] Palindrome Number
#
# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative? || ((x % 10).zero? && x != 0)

  reversed_number = 0
  while x > reversed_number
    reversed_number = reversed_number * 10 + x % 10
    x /= 10
  end
  x == reversed_number || x == reversed_number / 10
end
