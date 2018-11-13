def square (array)
  arr = []
  array.each {|i| arr << i ** 2}
  return arr
end
a = [2,4]
p square(a)
