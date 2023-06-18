def angle_between_time_arrows(hours, minutes)
  angle_hour_one_hour = 360.0 / 12.0                 # 30.0
  angle_hour_one_minute = angle_hour_one_hour / 60.0 # 0.5
  angle_minute_one_minute = 360.0 / 60.0             # 6.0

  hours = hours.to_f
  minutes = minutes.to_f

  if [12.0, 24,0].include? hours
    hours = 0.0
  elsif hours > 12.0
    hours -= 12.0
  end
  # ^^^ 24-hours-format supported.
  
  result = (angle_hour_one_hour*hours + angle_hour_one_minute*minutes - angle_minute_one_minute*minutes).abs
  result = 360.0 - result if result > 180.0
  result
end

p "12:00 => #{angle_between_time_arrows(12, 00)} (correct: 0.0)"
p "12:15 => #{angle_between_time_arrows(12, 15)} (correct: 82.5)"
p "12:30 => #{angle_between_time_arrows(12, 30)} (correct: 165.0)"
p "12:45 => #{angle_between_time_arrows(12, 45)} (correct: 112.5)"
p "15:00 => #{angle_between_time_arrows(15, 00)} (correct: 90.0)"
p "15:15 => #{angle_between_time_arrows(15, 15)} (correct: 7.5)"
p "15:30 => #{angle_between_time_arrows(15, 30)} (correct: 75.0)"
p "15:45 => #{angle_between_time_arrows(15, 45)} (correct: 157.5)"
p "18:00 => #{angle_between_time_arrows(18, 00)} (correct: 180.0)"
p "18:15 => #{angle_between_time_arrows(18, 15)} (correct: 97.5)"
p "18:30 => #{angle_between_time_arrows(18, 30)} (correct: 15.0)"
p "18:45 => #{angle_between_time_arrows(18, 45)} (correct: 67.5)"
p "21:00 => #{angle_between_time_arrows(21, 00)} (correct: 90.0)"
p "21:15 => #{angle_between_time_arrows(21, 15)} (correct: 172.5)"
p "21:30 => #{angle_between_time_arrows(21, 30)} (correct: 105.0)"
p "21:45 => #{angle_between_time_arrows(21, 45)} (correct: 22.5)"
