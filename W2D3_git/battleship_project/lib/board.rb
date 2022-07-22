class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def size
    @size
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col]
  end

  def []=(pos, val)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = val
  end

  def num_ships
    count = 0
    @grid.each do |subarr|
      subarr.each do |ele|
        if ele == :S
          count += 1
        end
      end
    end
    count
  end

  def attack(pos)
    if self.[](pos) == :S
      self.[]=(pos, :H)
      puts "you sunk my battleship!"
      return true
    else
      self.[]=(pos, :X)
      return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25

    while num_ships < total_ships
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      @grid[rand_row][rand_col] = :S
    end
  end

  def hidden_ships_grid
    new_grid = Array.new(@grid.length) { Array.new(@grid[0].length, :N) }
    i = 0
    while i < @grid.length
      j = 0
      while j < @grid[0].length
        if @grid[i][j] == :S
          new_grid[i][j] = :N
        else
          new_grid[i][j] = @grid[i][j]
        end
        j += 1
      end
      i += 1
    end
    new_grid
  end

  def self.print_grid(arr)
    arr.each do |subarr|
      puts subarr.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
