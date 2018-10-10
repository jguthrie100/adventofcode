i = 0
steps = 0
list = []

File.open('day5-list_jump.txt').each do |line|
  list.push(line.chomp.to_i) if line.chomp != ""
end

while i >= 0 && i < list.length
  prev = i
  i += list[i]
  list[prev] += 1
  steps += 1
end


puts "Solution: #{steps}"