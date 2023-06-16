def angle_between_time_arrows(hours, minutes)
  angle_hour_one_hour = 360.0 / 12.0 # 30.0
  angle_hour_one_minute = angle_hour_one_hour / 60.0 # 0.5
  angle_one_minute = 360.0 / 60.0 # 6.0

  hours = hours.to_f
  minutes = minutes.to_f

  if [12.0, 24,0].include? hours
    hours = 0.0
  elsif hours > 12.0
    hours -= 12.0
  end


  result = (angle_hour_one_hour*hours + angle_hour_one_minute*minutes - angle_one_minute*minutes).abs
  
  if result >= 360.0
    result -= 360.0
  end

  if result > 180.0
    result -= 180.0
  end
  
  # while result > 180.0
  #   p result -= 180.0
  # end

  result
end

p angle_between_time_arrows(12, 00) # 0
p angle_between_time_arrows(12, 15) # <90
p angle_between_time_arrows(12, 30) # <180
p angle_between_time_arrows(12, 45) # <90
p angle_between_time_arrows(15, 00) # 90
p angle_between_time_arrows(15, 15) # >0
p angle_between_time_arrows(15, 30) # <90
p angle_between_time_arrows(15, 45) # <180
p angle_between_time_arrows(18, 00) # 180
p angle_between_time_arrows(18, 15) # >90
p angle_between_time_arrows(18, 30) # >0
p angle_between_time_arrows(18, 45) # <90
p angle_between_time_arrows(21, 00) # 90
p angle_between_time_arrows(21, 15) # <180
p angle_between_time_arrows(21, 30) # >90
p angle_between_time_arrows(21, 45) # 22.5
