#
# @lc app=leetcode id=42 lang=ruby
#
# [42] Trapping Rain Water
#
# @param {Integer[]} height
# @return {Integer}
def trap(height)
  elevation_heights = []
  size = 0
  start_index = 0
  loop do
    elevation_heights = []
    (start_index...height.size).each do |index|
      next if height[index].zero?

      if elevation_heights.empty? || height[index] < height[elevation_heights[0]]
        elevation_heights << index
      else
        elevation_width = index - 1 - elevation_heights[0]
        if elevation_width.positive?
          elevation_height = height[elevation_heights[0]]
          size += elevation_height * elevation_width
          if elevation_heights.size > 1
            elevation_heights.shift
            size -= elevation_heights.map { |height_index| height[height_index] }.reduce(:+)
          end
        end
        elevation_heights = [index]
      end
    end
    break if elevation_heights.size < 2

    start_index = elevation_heights[0]
    height[elevation_heights[0]] -= 1
  end
  size
end
