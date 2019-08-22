# @param {Integer} num
# @return {String[]}
def read_binary_watch(num)
  hours_hash = { 0 => ["0"],
                 1 => ["1","2","4","8"],
                 2 => ["3", "5", "6", "9", "10"],
                 3 => ["7","11"]}
  minutes_hash = {0 => ["00"],
                  1 => ["01","02","04","08","16","32"],
                  2 => ["03", "05", "06", "09", "10", "12", "17", "18", "20", "24", "33", "34", "36", "40", "48"],
                  3 => ["07", "11", "13", "14", "19", "21", "22", "25", "26", "28", "35", "37", "38", "41", "42", "44", "49", "50", "52", "56"],
                  4 => ["15", "23", "27", "29", "30", "39", "43", "45", "46", "51", "53", "54", "57", "58"],
                  5 => ["31","47","55","59"]}
  max_hour_bits = [3, num].min
  result = []
  for hour_bit in 0..max_hour_bits
    hours = hours_hash[hour_bit]
    hours.each { |hour|
      minutes_bit = num - hour_bit
      next if minutes_bit > 5
      minutes = minutes_hash[minutes_bit]
      result += minutes.map { |mintue| "#{hour}:#{mintue}"  }
    }
  end
  return result
end

# @param {Integer} num
# @return {String[]}
# def read_binary_watch(num)
#   res = []
#   (0..11).each do |h|
#     (0..59).each do |s|
#       res.push "#{h}:#{s.to_s.rjust(2, "0")}" if (h.to_s(2)+s.to_s(2)).count('1') == num
#     end
#   end
#   res
# end
