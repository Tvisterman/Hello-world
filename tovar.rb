hash = {}
loop do
  puts 'Наименование товара?'
  a = gets.chomp.to_s
  break if a == 'стоп'

  puts 'Цена?'
  b = gets.chomp.to_i

  puts 'Количество'
  c = gets.chomp.to_i

  hash[a] = {cost:b, amount:c}
end
 p hash

sum = 0
total = 0

 hash.each do |a, cost_amount|
   sum = cost_amount[:cost] * cost_amount[:amount]
   total += sum
   puts "#{a} = #{sum}"
   puts "Total:#{total}."
 end
