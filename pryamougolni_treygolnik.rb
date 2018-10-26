puts 'a?'
a = gets.chomp.to_f

puts 'b?'
b = gets.chomp.to_f

puts 'c?'
c = gets.chomp.to_f

res = (a*a) + (b*b)

puts "#{res}"
if Math.sqrt(res) == c
puts 'Это прямоугольный треугольник'
else puts 'Это не является прямоуголным треугольником'
end
if a==b || b==c || c==a
  puts 'Это равнобедренный треугольник'
if (a==b && b==c && c==a)
  puts 'Это равносторонний треугольник'
end
else puts 'Это не равнобедренный треугольник'
end
