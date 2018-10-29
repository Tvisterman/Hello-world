alphabet = "a".."z"
vowels = ["a", "e", "i", "o", "u"]
vowels_sorted = {}

alphabet.each_with_index { |item, index|
  vowels_sorted [index + 1] = item if vowels.include? (item)}
  puts "#{vowels_sorted}"
