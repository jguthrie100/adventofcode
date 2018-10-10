target = 368078

edge = 1
ring = 0

while edge*edge < target
  edge += 2
  ring += 1
end

d = (edge-1)/2 # dist from centre point of edge

t = edge*edge
inc = 1

# count back from corner of ring towards target
while t > target
  t -= 1

  if d == (edge-1)/2 || d == 0
    inc *= -1
  end

  d += inc
end

puts d + ring # manhattan dist
