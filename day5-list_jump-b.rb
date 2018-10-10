i = 0
steps = 0
list = []

File.open('day5-list_jump.txt').each do |line|
  list.push(line.chomp.to_i) if line.chomp != ""
end

while i >= 0 && i < list.length
  prev = i
  i += list[i]

  if list[prev] >= 3
    list[prev] -= 1
  else
    list[prev] += 1
  end
  
  steps += 1
end


puts "Solution: #{steps}"