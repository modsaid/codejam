#!/usr/local/bin/ruby

test_cases = gets.strip.to_i
1.upto(test_cases) do |testi|
  r, k , n =  gets.split.collect{|c| c.to_i}
  groups =  gets.split.collect{|c| c.to_i}

  puts "R: #{r}, K: #{k}, Groups: #{groups.join(', ')}"

  revenue = 0
  rolling = []
  used = 0
  r.times do
    #fill the queue
    while  !groups.empty? &&  (((@g = groups.shift) + used ) <= k)  do
      used += @g
      rolling << @g
    end
    #back to the queue
    groups.unshift(@g) if @g + used > k

    #rock and roll
    revenue +=used
    used = 0
    puts "revenue = #{revenue} , Rolling: #{rolling.join(', ')} "
    while !rolling.empty? do
       groups << rolling.shift
    end
  end
  puts "Case ##{testi}: #{revenue}"
end
