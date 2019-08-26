# @param {Integer} n
# @return {Integer}
def fib(n)
  first = 0
  second = 1
  n.times do
    first, second = second, first + second
  end
  first
end

# @param {Integer} n
# @return {Integer}
# def fib(n)
#   if n > 1
#     fib(n - 1) + fib(n - 2)
#   elsif n == 1
#     1
#   else
#     0
#   end
# end
