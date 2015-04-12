
t = gets.strip.to_i
1.upto(t) do |ccc|
  max, shyness = gets.split
  counts = shyness.split(//).map(&:to_i)

  answer = 0

  available = counts[0] # The initial audience that will clap directly

  1.upto(max.to_i) do |i|
    current=counts[i]
    needed = i - available
    if (needed > 0)
      available += current + needed
      answer += needed
    else
      available += current
    end

  end



  puts "Case ##{ccc}: #{answer}"
end
