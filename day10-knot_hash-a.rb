list = (0..255).to_a
input = nil
skip = 0
pos = 0
i = 0

File.open('day10-knot_hash.txt').each do |line|
  input = line.split(",").map(&:to_i)
end

while input.length > 0
  i = 0
  while i < (input.first/2).floor
    list[(i+pos)%list.length], list[(pos+input.first-1-i)%list.length] = list[(pos+input.first-1-i)%list.length], list[(i+pos)%list.length] # swap elements
    i += 1
  end

  pos = (pos + input.first + skip) % list.length
  skip += 1
  input.shift
end

puts "Solution: #{list[0] * list[1]}"