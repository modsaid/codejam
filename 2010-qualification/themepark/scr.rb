#!/usr/local/bin/ruby

test_cases = gets.strip.to_i
1.upto(test_cases) do |testi|
  r, k , n =  gets.split.collect{|c| c.to_i}
  groups =  gets.split.collect{|c| c.to_i}

#  puts "R: #{r}, K: #{k}, Groups: #{groups.join(', ')}"

  revenue = 0
  rolling = []
  used = 0
  seats = 0
  while r > 0 do
    candidate = groups.first
    if (used + candidate) > k || seats == groups.size 
      #no place, let's roll
      revenue = revenue + used
      used = 0
      r -= 1
      seats = 0
      puts "revenue: #{revenue}, GR: #{groups.join(', ')}"
    end
    used +=candidate 
    groups << groups.shift
    seats += 1
  end
  puts "Case ##{testi}: #{revenue}"
end
