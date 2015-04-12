t = gets.strip.to_i

1.upto(t) do |ccc|
  x, r, c = gets.split.map(&:to_i)

  answer = "GABRIEL"
  ps="x=#{x}\tr=#{r}\tc=#{c}\tfactor=#{r*c*1.0/x}"

  if (r*c) % x > 0
    answer = "RICHARD" 
  else
    a = [r, c].max 
    b = [r, c].min
    x.downto((x+1)/2) do |w|
      h = x - w + 1
      next if h > w
      if (h > b) || (w > a)
        ps= "#{ps}\ta=#{a}\tb=#{b}\tw=#{w}\th=#{h}"
        answer="RICHARD"
        break
      end

      if (h==b) && (a * b / x > 1) && (x>3)
        ps= "#{ps}\ta=#{a}\tb=#{b}\tw=#{w}\th=#{h} *"
        answer="RICHARD"
        break
      end

    end
  end

  puts "Case ##{ccc}: #{answer}"#  +"\t#{ps}"
end
