first_digit = nil
prev_digit = nil
curr_digit = nil
total = 0

File.open('day1-inverse-captcha.txt').each do |line|
  line.chomp!

  line.length.times do |i|
    if line[i] == line[(i + line.length/2)%line.length]
      total += line[i].to_i
    end
  end
end

puts total