def set_cell(cell, val)
  x = cell[0]
  y = cell[1]

  $board[x] = $board[x] || Hash.new
  $board[x][y] = val
end

def surrounding_total(cell)
  total = 0

  x = cell[0]
  y = cell[1]

  [x-1, x, x+1].each do |i|
    [y-1, y, y+1].each do |j|
      next if i == x && j == y

      if $board.has_key?(i)
        if $board[i].has_key?(j)
          total += $board[i][j]
        end
      end
    end
  end

  return total
end

target = 368078

$board = Hash.new
curr_cell = [0, 0]
curr_val = 1
set_cell(curr_cell, curr_val)

# move around the board in a spiral
count = 0
dist = 1
dir = 0
dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]]

while curr_val < target

  # update direction and distance along edge
  if count > 0 && count % dist == 0
    dir += 1

    if dir > 0 && dir % 2 == 0
      dist += 1
    end
  end

  

  curr_cell = [curr_cell[0] + dirs[dir%4][0], curr_cell[1] + dirs[dir%4][1]]
  count += 1

  curr_val = surrounding_total(curr_cell)
  set_cell(curr_cell, curr_val)
end

puts "Solution: #{curr_val}"