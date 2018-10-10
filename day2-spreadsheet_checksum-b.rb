checksum = 0

File.open('day2-spreadsheet_checksum.txt').each do |line|
  vals = line.split(/\s+/).map(&:to_i).sort

  c = nil
  i = 0

  while vals.length >= 2
    if i == vals.length-1
      i = 0
      vals.pop
    end

    if vals.last % vals[i] == 0
      checksum += (vals.last / vals[i]).to_i
      break
    end

    i += 1
  end
end

puts checksum