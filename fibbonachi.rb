fibonacci = [1]
fibonacci_num = 1

while fibonacci_num <= 100 do
  fibonacci << fibonacci_num
  fibonacci_num = fibonacci [-2] +
  fibonacci[-1]

end
puts fibonacci
