
t = gets.strip.to_i


def best_answer(plates)
  plates.sort!.reverse!
  counts={}
  plates.each{|x| counts[x]||=0; counts[x]+=1}
  uniq = plates.uniq
  needed = 0

  while !(uniq.empty?) do 
    current_cost = max = uniq[0]
    if current_cost <= 3
      print "-"
      return current_cost + needed
    end

    batch = counts[current_cost]
    next_cost = 0
    if uniq[1].nil?
      next_cost = best_answer([(max+1) / 2]) + batch
    else
      next_plates = plates[(counts[max])..(-1)]
      half = (1 + max) / 2
      batch.times do 
        next_plates << half
        next_plates << max - half
      end
      next_cost = best_answer(next_plates) + batch
    end

    if (current_cost <= next_cost) 
      print "*"
      return current_cost + needed
    else
      return next_cost + needed
    end
  end
  print "="
  return plates.first
end


1.upto(t) do |ccc|
  diners = gets.to_i
  plates = gets.split.map(&:to_i)
  answer = best_answer(plates)
  puts "Case ##{ccc}: #{answer}"
end
