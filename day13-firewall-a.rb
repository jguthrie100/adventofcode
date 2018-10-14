layers = []

File.open('day13-firewall.txt').each do |line|
  next if line.chomp == ""

  m = line.match(/(\d+): (\d+)/)
  layers[m[1].to_i] = [0, 1, m[2].to_i]
end

pos = -1
severity = 0

layers.length.times do
  pos += 1

  layers.length.times do |i|
    # Check if packet moves onto security bot
    unless layers[i].nil?
      if i == pos && layers[i][0] == 0
        severity += (i * layers[i][2])
      end

      # Move security bots up and down the firewall
      layers[i][0] += layers[i][1]
      if layers[i][0] == (layers[i][2]-1) || layers[i][0] == 0
        layers[i][1] *= -1
      end
    end
  end
end

puts "Solution: #{severity}"