checksum = 0

File.open('day2-spreadsheet_checksum.txt').each do |line|
  vals = line.split(/\s+/).map(&:to_i).sort

  checksum += (vals.last - vals.first)
end

puts checksum