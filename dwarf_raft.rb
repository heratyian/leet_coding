
def solution(n, s, t)
  # N = 4
  # S = '1B 1C 4B 1D 2A' 'barrels'
  # T = '3B 2D' 'dwarves'

  # 1. model the raft
  raft = create_raft(n)

  # 2. add cargo / passengers
  load_raft(raft, s.split(' '), 'b')
  load_raft(raft, t.split(' '), 'd')

  puts raft.to_s
  # 3. compute open seat count
  front_open_seat_count = front_open_seat_count(raft)
  back_open_seat_count = back_open_seat_count(raft)
  left_open_seat_count = left_open_seat_count(raft)
  right_open_seat_count = right_open_seat_count(raft)

  # should return 6
  [front_open_seat_count, back_open_seat_count, left_open_seat_count, right_open_seat_count].min * 2
end

def front_open_seat_count(raft)
  n = raft.length
  open_seat_count = 0
  (0...n/2).each do |row_index|
    raft[row_index].each do |seat|
      open_seat_count += 1 if seat.empty?
    end
  end

  open_seat_count
end

def back_open_seat_count(raft)
  n = raft.length
  open_seat_count = 0
  (n/2...n).each do |row_index|
    raft[row_index].each do |seat|
      open_seat_count += 1 if seat.empty?
    end
  end

  open_seat_count
end

def left_open_seat_count(raft)
  n = raft.length
  open_seat_count = 0
  (0...n).each do |row_index|
    (0...n/2).each do |col_index|
      seat = raft[row_index][col_index]
      open_seat_count += 1 if seat.empty?
    end
  end

  open_seat_count
end

def right_open_seat_count(raft)
  n = raft.length
  open_seat_count = 0
  (0...n).each do |row_index|
    (n/2...n).each do |col_index|
      seat = raft[row_index][col_index]
      open_seat_count += 1 if seat.empty?
    end
  end

  open_seat_count
end

# raft [[]]
# barrels ['1B', '1C', '4B', '1D', '2A']
# icon == 'b'
def load_raft(raft, coordinates, icon)
  coordinates.each do |coordinate|
    row = coordinate[0].to_i - 1
    col = char_index(coordinate[1])
    raft[row][col] = icon
  end

  raft
end

# a = 0, b = 1, etc.
def char_index(c)
  c.downcase.bytes[0] - 97
end

def create_raft(n)
  matrix = []
  n.times do
    row = []
    n.times { row.append '' }
    matrix.append(row)
  end

  matrix
end

solution(4, '1B 1C 4B 1D 2A', '3B 2D')

# [
#   ['1A', '1B', '1C', '1D'],
#   ['2A', '2B', '2C', '2D'],
#   ['3A', '3B', '3C', '3D'],
#   ['4A', '4B', '4C', '4D'],
# ]
