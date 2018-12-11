
def count_chars(arr_strings)
  arr_strings.map{ |key| {key => key.size} }
end

def remove_duplicates(valiues_list, numbers_list)
  numbers_list -= valiues_list
end

class Block
  attr_reader :width
  attr_reader :length
  attr_reader :height

  def initialize(length, width, height)
    @length = length
    @width = width
    @height = height
  end

  def volume
    v = length * width * height
  end

  def surface_area
    s1 = length * width
    s2 = width * height
    s3 = length * height
    (s1 + s2 + s3) * 2
  end
end
