input = nil

File.open('day11-hex_travel.txt').each do |line|
  input = line.chomp.split(",")
  break
end

i = 0
opps = {
  "n" => "s",
  "s" => "n",
  "ne" => "sw",
  "sw" => "ne",
  "nw" => "se",
  "se" => "nw"
}

opps2 = {
  ["n", "se"] => "ne",
  ["n", "sw"] => "nw",
  ["ne", "nw"] => "n",
  ["s", "ne"] => "se",
  ["s", "nw"] => "sw",
  ["se", "sw"] => "s"
}

# Simplify all directions to the most direct path
2.times do
  opps2.each do |k, v|
    while input.index(k[0]) && input.index(k[1])
      input.delete_at(input.index(k[0]))
      input.delete_at(input.index(k[1]))
      input.push(v)
    end
  end

  opps.each do |k, v|
    while input.index(k) && input.index(v)
      input.delete_at(input.index(k))
      input.delete_at(input.index(v))
    end
  end
end

puts "Solution: #{input.length}"