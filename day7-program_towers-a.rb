towers = Array.new
names = Array.new

File.open('day7-program_towers.txt').each do |line|
  names.push(line.match(/^\w+/)[0])
  t = line.split("->")[1]&.split(",")&.map(&:lstrip)&.map(&:rstrip)
  towers.concat(t) unless t.nil?
end

names.each do |n|
  unless towers.include?(n)
    puts "Solution: #{n}"
  end
end