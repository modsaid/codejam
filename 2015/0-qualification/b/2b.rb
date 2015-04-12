## Author: modsaid
# New Fresh attempt

t = gets.strip.to_i

def cost(plates=[])
  return 0 if plates.empty?
  plates.sort!
  plates.reverse!
  counts = {}
  plates.each{|x| counts[x] ||= 0 ; counts[x] += 1}
  uniq = plates.uniq

  split_cost = counts[uniq.first] # the number of occurrences for the  largest element
  current_cost = uniq.first       # the cost of just waiting, with no splitting

  return current_cost if current_cost <= 3

  next_plates=plates

  half = uniq.first / 2
  
  if (uniq.size==1)
    next_plates = []
    split_cost.times{ next_plates << half ; next_plates << uniq.first - half }
  else
    next_plates = plates[split_cost..(-1)]
    split_cost.times{ next_plates << half ; next_plates << uniq.first - half }
  end

  new_cost = split_cost + cost(next_plates)
  return (current_cost <= new_cost) ? current_cost : new_cost
end

1.upto(t) do |ccc|
  diners = gets.to_i
  line   = gets
  plates = line.split.map(&:to_i)
  answer = cost(plates)
  # sorted=plates.sort.reverse
  puts "Case ##{ccc}: #{answer}" #+ "\t#{sorted.join(' ')}\t#{'*' if sorted.first == answer}"
end
