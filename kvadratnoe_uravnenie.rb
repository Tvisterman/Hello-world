puts 'a?'
c = gets.chomp.to_f

puts 'b?'
b = gets.chomp.to_f

puts 'c?'
c = gets.chomp.to_f

d = (b * b) - (4 * a * c)
if d > 0
  x1 = (-b + math.sqrt * (d)) / (2 * a)
  x2 = (-b - math.sqrt * (d)) / (2 * a)
  puts '#{x1, x2}'

elseif d == 0
  x1 = (-b) / (2 * a)
puts "#{x}"
else d<0
  puts 'Нет корней'
end
