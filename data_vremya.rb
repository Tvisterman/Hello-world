def ask(str)
  massage = case str
  when 'time'
    time = Time.now.strftime("%H:%M")
    p time
  when 'date'
    date = Time.now.strftime("%d:%B:%Y")
    p date
  when 'day'
    day_of_the_week = Time.now.strftime("%A")
    p  day_of_the_week
  when 'remaining days'
    remaining_days = (366) - Time.now.strftime("%j").to_i
    p remaining_days
  when 'remaining weeks'
     remaining_weeks = (53) - Time.now.strftime("%W").to_i
     p remaining_weeks
   else Integer or Float
     p 'Wrong input'
  end
end

ask 'remaining days'
