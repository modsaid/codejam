#!/usr/local/bin/ruby
l, d, n = gets.split
puts "Letters: #{l}"
puts "Words: #{d}"
puts "Test Cases: #{n}"

words = []
d.to_i.times{ words << gets }

def bit(char)
  char[0] - 'a'[0]
end

n.to_i.times do 
  test_case = gets
  pattern = []
  test_case.split('(').collect{|a| a.split(")")}.each do |a|
    if a.size > 0
      pattern << a[0].scan(/./)
      if a.size > 1
        pattern = pattern + a[1].scan(/./)
      end
    end
  end
  puts pattern.collect{|s| "(#{s.join('')})"}.join('')
end



