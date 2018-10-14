$nodes = {}
$node_list = []
group_size = 0

def node_count(id)
  $node_list.push(id)

  $nodes[id].each do |n|
    unless $node_list.include?(n)
      node_count(n)
    end
  end
end

File.open('day12-message_pipes.txt').each do |line|
  next if line.chomp == ""

  m = line.split(" <-> ")
  $nodes[m[0].to_i] = m[1].split(", ").map(&:to_i)
end

groups = []

$nodes.length.times do |i|
  $node_list.clear
  unless groups.flatten.include?(i)
    node_count(i)
    groups.push($node_list.dup)
  end
end


puts "Solution: #{groups.length}"