def score_throws(radius = [])
    score = 0
    radius.each do |r|
    if r < 5
    score = score + 10
    elsif r >= 5 && r <= 10
    score = score + 5
    return "0" if radius == empty
     end
  end
  p score
end

score_throws []
