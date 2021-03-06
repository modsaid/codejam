#!/usr/local/bin/ruby
require 'rational'

t = gets.strip.to_i
1.upto(t) do |ccc|
  occurances = gets.split.collect{|c| c.to_i}
  n = occurances.shift

  occurances = occurances.uniq.sort
  (1..(occurances.size - 2)).collect{|i|  occurances[i+1] - occurances[i] }
  gaps = (0..(occurances.size - 2)).collect{|i|  occurances[i+1] - occurances[i] }.uniq
  
  gap = gaps.first
  gaps.each do |g|
    gap = gap.gcd(g)
  end  
  minval = occurances.first

  tk = (gap < 1) ? 0 : (minval/gap  +  (minval % gap > 0 ? 1 : 0) )
  answer = (gap < 1) ? 0 : (tk * gap) - minval
  puts "Case ##{ccc}: #{answer}"
end
