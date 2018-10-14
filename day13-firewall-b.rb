input = []

File.open('day13-firewall.txt').each do |line|
  next if line.chomp == ""

  m = line.match(/(\d+): (\d+)/)
  input[m[1].to_i] = m[2].to_i
end

caught = true
pause = 0

while caught
  caught = false

  input.length.times do |i|
    next if input[i].nil?
    if (i+pause) % ((input[i] * 2)-2) == 0
      caught = true
      break
    end
  end

  pause += 1
end

puts "Solution: #{pause-1}"