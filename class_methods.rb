class Array
  def average
    s = self.sum.to_f / self.size
    p s
  end

  def square
    mas = []
    self.each {|i| mas << i ** 2}
    p mas
  end

  def even_odd
    even = self.find_all{|elem| elem % 2 == 0}
    odd = self.find_all{|elem| elem % 2 != 0}
    p [even, odd]
  end

  def reverse_strings
    str = self.to_s.reverse
    p str
  end
end

arr = [1,2,3,4]
arr.average
