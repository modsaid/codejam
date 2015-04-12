
t = gets.strip.to_i

mapping = {
  "11"=>"1",
  "1i"=>"i",
  "1j"=>"j",
  "1k"=>"k",
  "i1"=>"i",
  "ii"=>"-1",
  "ij"=>"k",
  "ik"=>"-j",
  "j1"=>"j",
  "ji"=>"-k",
  "jj"=>"-1",
  "jk"=>"i",
  "k1"=>"k",
  "ki"=>"j",
  "kj"=>"-i",
  "kk"=>"-1"
}


1.upto(t) do |ccc|


  puts "Case ##{ccc}: #{answer}"
end
