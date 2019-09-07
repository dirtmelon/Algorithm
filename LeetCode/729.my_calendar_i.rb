# class MyCalendar
#   def initialize
#     @calendars = []
#   end

#   def book(start_day, end_day)
#     @calendars.each do |calendar|
#       return false if start_day < calendar[1] && end_day > calendar[0]
#     end
#     @calendars << [start_day, end_day]
#     true
#   end
# end

class MyCalendar
  def initialize
    @calendars = []
    @root = nil
  end

  def book(start_day, end_day)
    if @root.nil?
      @root = CalendarNode.new(start_day, end_day)
      true
    else
      @root.insert(CalendarNode.new(start_day, end_day))
    end
  end
  end

class CalendarNode
  attr_accessor :start_day
  attr_accessor :end_day
  def initialize(start_day, end_day)
    @start_day = start_day
    @end_day = end_day
    @left = nil
    @right = nil
  end

  def insert(node)
    if node.end_day <= @start_day
      if @left.nil?
        @left = node
        true
      else
        @left.insert(node)
      end
    elsif node.start_day >= @end_day
      if @right.nil?
        @right = node
        true
      else
        @right.insert(node)
      end
    else
      false
    end
  end
end
