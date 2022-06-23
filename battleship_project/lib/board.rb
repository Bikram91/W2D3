class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](arr)
    row = arr[0]
    column = arr[1]
    @grid[row][column]
  end

  def []=(pos, value)
    row = pos[0]
    column = pos[1]
    @grid[row][column] = value
  end

  def num_ships
    count = 0
    @grid.each do |subarray|
      subarray.each do |ele|
        if ele == :S
          count += 1
        end
      end
    end
    count
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        p 'you sunk my battleship!'
        return true
    else
        self[pos] = :X
        return false
    end
  end
end
