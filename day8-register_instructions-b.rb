regs = Hash.new(0)
high_val = 0

File.open('day8-register_instructions.txt').each do |line|
  m = line.chomp.match(/(\w+) (inc|dec) (-?\d+) if (\w+) (.+?) (-?\d+)/)

  amt = m[3].to_i
  amt *= -1 if m[2] == "dec"

  if regs[m[4]].method(m[5]).(m[6].to_i)
    regs[m[1]] += amt
  end

  high_val = [high_val, regs[m[1]]].max
end

puts "Solution: #{high_val}"