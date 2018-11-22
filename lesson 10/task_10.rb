def perform(action, arr = [])
  return if action != '' && arr.empty?

  result =
    if block_given?
    else
      'Пожалуйста, дайте мне инструкции'
    end
    p result
end

strings = ['Vitaliy, Aliya, Dmitriy ', 'Wolf, Dog']

perform('find words', strings) do |action, arr|
  max_words_size = strings.map { |string| string.split.size }.max
  strings.find { |string| string.split.size == max_words_size }
end

arr = [1, 4, 2, 6, 9, 6]
perform('parse numbers', arr) do |action, arr|
  arr.map.with_index(1) { |number, index| [index, number]}.to_h
end
