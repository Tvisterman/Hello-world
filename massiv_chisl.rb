dup = []
for i in (1..100)
  dup << i if i % 5 == 0
end
puts dup.inspect
