def perform(action, arr = [])
  return if action != '' && arr.empty?

  if block_given?
    yield(action, arr)
  else
    p 'Пожалуйста, дайте мне инструкции'
  end
end

words = ['Vitaliy, Aliya, Dmitriy ', 'Wolf, Dog']

perform('find words', words) do |action, arr|
  p words.flatten.max_by(&:size)
end

num = [1, 2, 3, 4, 5, 6]
perform('parse numbers', num) do |action, arr|
  p num = Hash[num.map {|h| [h, h]}]
end
