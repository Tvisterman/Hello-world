def score_throws(radius = [])
  return "0" if radius.empty?
  score = 0

  radius.each do |r|
    if r < 5
      score = score + 10
    elsif r >= 5 && r <= 10
      score = score + 5
    end
  end
  r2 = []
  radius.each do |i|
    if i < 5
       r2 << 1
    else
       r2 << 0
      end
    end
    score += 100 unless r2.include? (0)
    p score
  end
score_throws [4,4,4]
