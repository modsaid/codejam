#!/usr/local/bin/ruby

require 'rubygems'
require 'ruby-debug'

def key(y,x); (y << 10)+x; end
def yval(key); (key >> 10); end
def xval(key); key & 0x03FF ; end
def max(x,y); (x > y) ? x : y ; end 

test_cases = gets.strip.to_i
1.upto(test_cases) do |ccc|
  m, n = gets.strip.split.collect{|param| param.to_i }
  board=[]
  m.times do 
    line = gets.strip.split.collect{|param| param.to_i(16).to_s(2).rjust(40,'0')}.join.scan(/./).collect{|char| char.to_i } 
    board << line
    puts line.join('')
  end
  board_count={}
  found={}
  
  m.times do |y|
    n.times do |x|
      size = 1
      valid = true
      edgex = x
      edgey = y
      while (valid) do
        checks = []
#        debugger
        checks +=  x.upto(max(edgex, n - 1 )).collect{|i| 
          puts "board[edgey][i]\t#{edgey}\t#{i} #{board[edgey][i]}"
          puts "board[edgey+1][i]\t edgey:#{edgey+1}\ti:#{i}\tboard[edgey+1][i]:#{board[edgey+1][i]}\tboard[edgey][i]:#{board[edgey][i]}"
          puts "#{board[y]}"
          edgey==(m - 1) ? false : ((board[edgey][i] + board[edgey+1][i]) % 2) == 1 
        }
        checks +=  y.upto(max(edgey, m - 1 )).collect{|i| 
          edgex==(n - 1) ? false : ((board[i][edgex] + board[i][edgex+1]) % 2) == 1 
        }
        checks <<  board[edgey][edgex ] == board[edgey+1][edgex+1]

        if checks.include?(false) || (edgex==n-1) || (edgey==m-1)
          valid = false
        else
          edgex = x + size
          edgey = y + size
          size += 1
        end 
      end
      found[key(y,x)] = size
      board_count[size] = (board_count[size] || 0) + 1
    end
  end
  
  answer = founds.values.max
  
  puts "Case ##{ccc}: #{answer}"
  board_count.keys.sort.revert.each do |k|
    puts "#{k} #{board_count[k]}"
  end
end
