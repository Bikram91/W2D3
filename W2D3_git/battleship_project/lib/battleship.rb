require_relative "board"
require_relative "player"

class Battleship
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def board
    @board
  end

  def player
    @player
  end

  def start_game
    @board.place_random_ships
    puts "There are #{@board.num_ships} hidden ships on the board"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      print "you lose"
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships == 0
      print "you win"
      return true
    else
      return false
    end
  end

  def game_over?
    win? || lose?
  end

  def turn
  input = @player.get_move
  if !@board.attack(input)
    @remaining_misses -= 1
  end
  print @remaining_misses
  @board.print
  end
end
