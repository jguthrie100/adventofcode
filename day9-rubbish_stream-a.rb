stream = ""
level = 0
in_rubbish = false
skip_char = false
score = 0

File.open('day9-rubbish_stream.txt').each do |line|
  stream = line
end

stream.chars.each do |s|
  if skip_char
    skip_char = false
    next
  end

  if s == "{" && !in_rubbish
    level += 1
  end

  if s == "}" && !in_rubbish
    score += level
    level -= 1
  end

  if s == "<" && !in_rubbish
    in_rubbish = true
  end

  if s == ">" && in_rubbish
    in_rubbish = false
  end

  if s == "!" && in_rubbish
    skip_char = true
  end
end

puts "Solution: #{score}"