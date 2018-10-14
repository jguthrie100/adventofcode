input = nil

File.open('day11-hex_travel.txt').each do |line|
  input = line.chomp.split(",")
  break
end

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

max_dist = 0
input2 = []

while !input.empty?
  # Build up array by one cell each loop before simplifying to get furthest dist
  input2.push(input.shift)

  # Simplify all directions to the most direct path
  2.times do
    opps2.each do |k, v|
      while input2.index(k[0]) && input2.index(k[1])
        input2.delete_at(input2.index(k[0]))
        input2.delete_at(input2.index(k[1]))
        input2.push(v)
      end
    end

    opps.each do |k, v|
      while input2.index(k) && input2.index(v)
        input2.delete_at(input2.index(k))
        input2.delete_at(input2.index(v))
      end
    end
  end

  max_dist = [max_dist, input2.length].max
end

puts "Solution: #{max_dist}"