total = 0

File.open('day4-valid_passphrases.txt').each do |line|
  phrases = line.split(/\s+/).map { |e| e.chars.sort.join("") }.sort

  while phrases.length > 0
    if phrases.pop == phrases.last
      total -= 1
      break
    end
  end

  total += 1
end

puts "Solution: #{total}"