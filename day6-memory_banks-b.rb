banks = nil
history = []

File.open('day6-memory_banks.txt').each do |line|
  banks = line.split(/\s+/).map(&:to_i)
  break
end

while !history.include?(banks.dup)
  history.push(banks.dup)

  col = banks.index(banks.max)
  mem = banks[col]
  banks[col] = 0
  col += 1

  while mem > 0
    banks[col%banks.length] += 1
    mem -= 1
    col += 1
  end
end

puts "Solution: #{history.length - history.index(banks.dup)}"