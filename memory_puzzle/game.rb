require_relative "board"

class Game
  NUMS = "0123"

  
  def initialize()
    @board = Board.new.populate
  end
  
  def make_guess
    puts "Enter the position"
    pos = gets.chomp.split(",")
    unless pos.all? { |str| NUMS.include?(str) }
      puts "Enter try again"
      pos = gets.chomp.split(",")
    end

    pos

  end

  def run
    # @board.
  end


end


if __FILE__ == $PROGRAM_NAME


  game = Game.new
  p game.make_guess
end