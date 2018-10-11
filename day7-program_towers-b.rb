def get_wrong_weight(name)
  weights = {}
  error_name = nil

  $towers[name].each do |t|
    w = get_wrong_weight(t)
    weights[w] = weights[w] || Array.new
    weights[w].push(t)
  end

  return ((weights.first.first * weights.first.last.length) + $names[name]) if weights.length == 1
  return $names[name] if weights.length == 0

  # only get to this point if the root node of the error is found
  output = []
  weights.each do |k, v|
    if v.length == 1
      error_name = v.first
      output[1] = k
    else
      output[0] = k
    end
  end

 return [error_name, output]
end

$towers = Hash.new
$names = Hash.new
main = Hash.new
base = true

File.open('day7-program_towers.txt').each do |line|
  name = line.match(/^\w+/)[0]
  $names[name] = line.match(/\d+/)[0].to_i
  t = line.split("->")[1]&.split(",")&.map(&:lstrip)&.map(&:rstrip)
  $towers[name] = t || []
end

# determine base node
$names.keys.each do |n|
  base = true
  $towers.values.each do |t|
    if t.include?(n)
      base = false
    end
  end

  if base
    base = n
    break
  end
end

wrong_weight = get_wrong_weight(base)

diff = wrong_weight.flatten[-1] - wrong_weight.flatten[-2]

puts "Solution: #{$names[wrong_weight.flatten[-3]] - diff}"