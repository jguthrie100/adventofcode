list = (0..255).to_a
input = nil
skip = 0
pos = 0
i = 0

File.open('day10-knot_hash.txt').each do |line|
  input = line.chomp.chars.map(&:ord).concat([17, 31, 73, 47, 23])
end

64.times do
  input_temp = input.dup
  while input_temp.length > 0
    i = 0
    while i < (input_temp.first/2).floor
      list[(i+pos)%list.length], list[(pos+input_temp.first-1-i)%list.length] = list[(pos+input_temp.first-1-i)%list.length], list[(i+pos)%list.length] # swap elements
      i += 1
    end

    pos = (pos + input_temp.first + skip) % list.length
    skip += 1
    input_temp.shift
  end
end

dense_hash = []
# convert to sparse hash
while list.length > 0
  dense_hash.push(list.shift(16).reduce(:^))
end

output = dense_hash.map { |c| c.to_s(16).rjust(2, "0") }.join("")

puts "Solution: #{output}"