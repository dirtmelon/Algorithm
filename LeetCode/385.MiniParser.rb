# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def set_integer(value)
#        """
#        Set this NestedInteger to hold a single integer equal to value.
#        @return {Void}
#        """
#
#    def add(elem)
#        """
#        Set this NestedInteger to hold a nested list and adds a nested integer elem to it.
#        @return {Void}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

# @param {String} s
# @return {NestedInteger}
def deserialize(s)
  nested_stack = Array.new
  cur_nested = nil
  cur_num = nil
  signs = 1
  index = 0
  while index < s.size
    if s[index] == "["
      new_nested = NestedInteger.new
      if cur_nested != nil
        cur_nested.add(new_nested)
        nested_stack << cur_nested
      end
      cur_nested = new_nested
    elsif s[index] == "]"
      if cur_num != nil
        cur_nested.add(cur_num.to_i)
        cur_num = nil
        signs = 1
      end
      if !nested_stack.empty?
        cur_nested = nested_stack.pop
      end
    elsif s[index] == ","
      if cur_num != nil
        cur_nested.add(cur_num.to_i)
        cur_num = nil
        signs = 1
      end
    elsif s[index] == "-"
      signs = -1
    else
      if cur_num == nil
        cur_num = 0
      end
      cur_num = cur_num * 10
      if s[index] == "1"
        cur_num += 1
      elsif s[index] == "2"
        cur_num += 2
      elsif s[index] == "3"
        cur_num += 3
      elsif s[index] == "4"
        cur_num += 4
      elsif s[index] == "5"
        cur_num += 5
      elsif s[index] == "6"
        cur_num += 6
      elsif s[index] == "7"
        cur_num += 7
      elsif s[index] == "8"
        cur_num += 8
      elsif s[index] == "9"
        cur_num += 9
      end
    end
    index += 1
  end
  return NestedInteger.new.set_integer(cur_num.to_i) if cur_num != nil
  return cur_nested
end
