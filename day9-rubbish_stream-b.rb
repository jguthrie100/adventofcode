stream = ""
level = 0
in_rubbish = false
skip_char = false
score = 0
rubbish_count = 0

File.open('day9-rubbish_stream.txt').each do |line|
  stream = line
end

stream.chars.each do |s|
  if skip_char
    skip_char = false
    next
  end

  if !in_rubbish
    if s == "{"
      level += 1
    end

    if s == "}"
      score += level
      level -= 1
    end

    if s == "<"
      in_rubbish = true
    end
  else
    if s != "!" && s != ">"
      rubbish_count += 1
    end

    if s == ">"
      in_rubbish = false
    end

    if s == "!"
      skip_char = true
    end
  end
end

puts "Solution: #{rubbish_count}"