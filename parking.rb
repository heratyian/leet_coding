# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(e, l)
    # The entrance fee of the car parking lot is 2;
    # The first full or partial hour costs 3;
    # Each successive full or partial hour (after the first) costs 4.
  
    # e HH:MM, l HH:MM
    # (assume same day)
  
    diff = time_s_to_int(l) - time_s_to_int(e)

    puts diff
  
    hours = (diff.to_f / 100).ceil
    
    puts hours
    # eg e = "10:00", l = "13:21"
    # return 17
  
    # 1321 - 1000 = 321
    # 321 / 100 = 3.21
    # 3.21.ceil = 4
  
    # fee = 2
    # time -= 1 && fee += 3
    # while time > 0
      # fee += 4
      # time -= 1
  
    fee = 5
    hours -= 1
  

    while hours.positive? do
        puts 'here'
      fee += 4
      hours -= 1
    end
  
    fee
  end
  
  # "13:21" -> 1321
  def time_s_to_int(time_s)
    time_s.split('').filter { |c| c != ':' }.join('').to_i
  end

  
#   solution("09:42", "11:42")
solution( "10:00", "13:21")
